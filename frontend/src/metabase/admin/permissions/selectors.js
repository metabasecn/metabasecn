/* @flow weak */

import { createSelector } from 'reselect';

import { push } from "react-router-redux";

import MetabaseAnalytics from "metabase/lib/analytics";

import { isDefaultGroup, isAdminGroup, isMetaBotGroup } from "metabase/lib/groups";

import _ from "underscore";
import { getIn, assocIn } from "icepick";

import {
    getNativePermission,
    getSchemasPermission,
    getTablesPermission,
    getFieldsPermission,
    updateFieldsPermission,
    updateTablesPermission,
    updateSchemasPermission,
    updateNativePermission,
    diffPermissions,
    inferAndUpdateEntityPermissions
} from "metabase/lib/permissions";

import { getMeta } from "metabase/selectors/metadata";

import Metadata from "metabase/meta/metadata/Metadata";
import type { DatabaseId } from "metabase/meta/types/Database";
import type { SchemaName } from "metabase/meta/types/Table";
import type { Group, GroupsPermissions } from "metabase/meta/types/Permissions";

const getPermissions = (state) => state.admin.permissions.permissions;
const getOriginalPermissions = (state) => state.admin.permissions.originalPermissions;

const getDatabaseId = (state, props) => props.params.databaseId ? parseInt(props.params.databaseId) : null
const getSchemaName = (state, props) => props.params.schemaName


// reorder groups to be in this order
const SPECIAL_GROUP_FILTERS = [isAdminGroup, isDefaultGroup, isMetaBotGroup].reverse();

function getTooltipForGroup(group) {
    if (isAdminGroup(group)) {
        return "管理员具有最高权限"
    } else if (isDefaultGroup(group)) {
        return "每个数据库用户所属的所有用户组。如果要限制或限制组对某些内容的访问，请确保所有用户组具有相等或较低的访问级别。";
    } else if (isMetaBotGroup(group)) {
        return " metabot是配置数据库的冗余机器人。您可以选择它在这里访问的内容。 ";
    }
    return null;
}

export const getGroups = createSelector(
    (state) => state.admin.permissions.groups,
    (groups) => {
        let orderedGroups = groups ? [...groups] : [];
        for (let groupFilter of SPECIAL_GROUP_FILTERS) {
            let index = _.findIndex(orderedGroups, groupFilter);
            if (index >= 0) {
                orderedGroups.unshift(...orderedGroups.splice(index, 1))
            }
        }
        return orderedGroups.map(group => ({
            ...group,
            tooltip: getTooltipForGroup(group)
        }))
    }
);

export const getIsDirty = createSelector(
    getPermissions, getOriginalPermissions,
    (permissions, originalPermissions) =>
        JSON.stringify(permissions) !== JSON.stringify(originalPermissions)
)

export const getSaveError = (state) => state.admin.permissions.saveError;


// these are all the permission levels ordered by level of access
const PERM_LEVELS = ["write", "read", "all", "controlled", "none"];
function hasGreaterPermissions(a, b) {
    return (PERM_LEVELS.indexOf(a) - PERM_LEVELS.indexOf(b)) < 0
}

function getPermissionWarning(getter, entityType, defaultGroup, permissions, groupId, entityId, value) {
    if (!defaultGroup || groupId === defaultGroup.id) {
        return null;
    }
    let perm = value || getter(permissions, groupId, entityId);
    let defaultPerm = getter(permissions, defaultGroup.id, entityId);
    if (perm === "controlled" && defaultPerm === "controlled") {
        return `  "${defaultGroup.name}" group may have access to a different set of ${entityType} than this group, which may give this group additional access to some ${entityType}.`;
    }
    if (hasGreaterPermissions(defaultPerm, perm)) {
        return `The "${defaultGroup.name}" group has a higher level of access than this, which will override this setting. You should limit or revoke the "${defaultGroup.name}" group's access to this item.`;
    }
    return null;
}

function getPermissionWarningModal(entityType, getter, defaultGroup, permissions, groupId, entityId, value) {
    let permissionWarning = getPermissionWarning(entityType, getter, defaultGroup, permissions, groupId, entityId, value);
    if (permissionWarning) {
        return {
            title: `${value === "controlled" ? "Limit" : "Revoke"} access even though "${defaultGroup.name}" has greater access?`,
            message: permissionWarning,
            confirmButtonText: (value === "controlled" ? "Limit" : "Revoke") + " access",
            cancelButtonText: "Cancel"
        };
    }
}

function getControlledDatabaseWarningModal(permissions, groupId, entityId) {
    if (getSchemasPermission(permissions, groupId, entityId) !== "controlled") {
        return {
            title: "将此数据库更改为受限访问",
            confirmButtonText: "更改",
            cancelButtonText: "取消"
        };
    }
}

function getRawQueryWarningModal(permissions, groupId, entityId, value) {
    if (value === "write" &&
        getNativePermission(permissions, groupId, entityId) !== "write" &&
        getSchemasPermission(permissions, groupId, entityId) !== "all"
    ) {
        return {
            title: "允许读写？",
            message: "这个组对这个数据库具备读写权限",
            confirmButtonText: "确定",
            cancelButtonText: "取消"
        };
    }
}

// If the user is revoking an access to every single table of a database for a specific user group,
// warn the user that the access to raw queries will be revoked as well.
// This warning will only be shown if the user is editing the permissions of individual tables.
function getRevokingAccessToAllTablesWarningModal(database, permissions, groupId, entityId, value) {
    if (value === "none" &&
        getSchemasPermission(permissions, groupId, entityId) === "controlled" &&
        getNativePermission(permissions, groupId, entityId) !== "none"
    ) {
        // allTableEntityIds contains tables from all schemas
        const allTableEntityIds = database.tables().map((table) => ({
            databaseId: table.db_id,
            schemaName: table.schema || "",
            tableId: table.id
        }));

        // Show the warning only if user tries to revoke access to the very last table of all schemas
        const afterChangesNoAccessToAnyTable = _.every(allTableEntityIds, (id) =>
            getFieldsPermission(permissions, groupId, id) === "none" || _.isEqual(id, entityId)
        );
        if (afterChangesNoAccessToAnyTable) {
            return {
                title: " 撤消对所有表的访问权限？ ",
                message: "将撤销该组对该数据库的查询访问权",
                confirmButtonText: "禁止访问？",
                cancelButtonText: "取消"
            };
        }
    }
}

const OPTION_GREEN = {
    icon: "check",
    iconColor: "#9CC177",
    bgColor: "#F6F9F2"
};
const OPTION_YELLOW = {
    icon: "eye",
    iconColor: "#F9D45C",
    bgColor: "#FEFAEE"
};
const OPTION_RED = {
    icon: "close",
    iconColor: "#EEA5A5",
    bgColor: "#FDF3F3"
};


const OPTION_ALL = {
    ...OPTION_GREEN,
    value: "all",
    title: "授予不受限制的访问权",
    tooltip: "所有访问权限",
};

const OPTION_CONTROLLED = {
    ...OPTION_YELLOW,
    value: "controlled",
    title: "受限制的访问权",
    tooltip: "访问受限制",
    icon: "permissionsLimited",
};

const OPTION_NONE = {
    ...OPTION_RED,
    value: "none",
    title: "撤销访问",
    tooltip: "无任何权限",
};

const OPTION_NATIVE_WRITE = {
    ...OPTION_GREEN,
    value: "write",
    title: "写入和查询权限",
    tooltip: "可以查询和写入",
    icon: "sql",
};

const OPTION_NATIVE_READ = {
    ...OPTION_YELLOW,
    value: "read",
    title: "只可读",
    tooltip: "只读权限",
};

const OPTION_COLLECTION_WRITE = {
    ...OPTION_GREEN,
    value: "write",
    title: "收藏的集合",
    tooltip: "可以从这个集合中添加和删除",
};

const OPTION_COLLECTION_READ = {
    ...OPTION_YELLOW,
    value: "read",
    title: "浏览集合权限",
    tooltip: "只能查看集合",
};

export const getTablesPermissionsGrid = createSelector(
    getMeta, getGroups, getPermissions, getDatabaseId, getSchemaName,
    (metadata: Metadata, groups: Array<Group>, permissions: GroupsPermissions, databaseId: DatabaseId, schemaName: SchemaName) => {
        const database = metadata && metadata.database(databaseId);

        if (!groups || !permissions || !metadata || !database) {
            return null;
        }

        const tables = database.tablesInSchema(schemaName || null);
        const defaultGroup = _.find(groups, isDefaultGroup);

        return {
            type: "table",
            icon: "table",
            crumbs: database.schemaNames().length > 1 ? [
                ["Databases", "/admin/permissions/databases"],
                [database.name, "/admin/permissions/databases/"+database.id+"/schemas"],
                [schemaName]
            ] : [
                ["Databases", "/admin/permissions/databases"],
                [database.name],
            ],
            groups,
            permissions: {
                "fields": {
                    header: "Data Access",
                    options(groupId, entityId) {
                        return [OPTION_ALL, OPTION_NONE]
                    },
                    getter(groupId, entityId) {
                        return getFieldsPermission(permissions, groupId, entityId);
                    },
                    updater(groupId, entityId, value) {
                        MetabaseAnalytics.trackEvent("Permissions", "fields", value);
                        let updatedPermissions = updateFieldsPermission(permissions, groupId, entityId, value, metadata);
                        return inferAndUpdateEntityPermissions(updatedPermissions, groupId, entityId, metadata);
                    },
                    confirm(groupId, entityId, value) {
                        return [
                            getPermissionWarningModal(getFieldsPermission, "fields", defaultGroup, permissions, groupId, entityId, value),
                            getControlledDatabaseWarningModal(permissions, groupId, entityId),
                            getRevokingAccessToAllTablesWarningModal(database, permissions, groupId, entityId, value)
                        ];
                    },
                    warning(groupId, entityId) {
                        return getPermissionWarning(getFieldsPermission, "fields", defaultGroup, permissions, groupId, entityId);
                    }
                }
            },
            entities: tables.map(table => ({
                id: {
                    databaseId: databaseId,
                    schemaName: schemaName,
                    tableId: table.id
                },
                name: table.display_name,
                subtitle: table.name
            }))
        };
    }
);

export const getSchemasPermissionsGrid = createSelector(
    getMeta, getGroups, getPermissions, getDatabaseId,
    (metadata: Metadata, groups: Array<Group>, permissions: GroupsPermissions, databaseId: DatabaseId) => {
        const database = metadata && metadata.database(databaseId);

        if (!groups || !permissions || !metadata || !database) {
            return null;
        }

        const schemaNames = database.schemaNames();
        const defaultGroup = _.find(groups, isDefaultGroup);

        return {
            type: "schema",
            icon: "folder",
            crumbs: [
                ["Databases", "/admin/permissions/databases"],
                [database.name],
            ],
            groups,
            permissions: {
                "tables": {
                    header: "Data Access",
                    options(groupId, entityId) {
                        return [OPTION_ALL, OPTION_CONTROLLED, OPTION_NONE]
                    },
                    getter(groupId, entityId) {
                        return getTablesPermission(permissions, groupId, entityId);
                    },
                    updater(groupId, entityId, value) {
                        MetabaseAnalytics.trackEvent("Permissions", "tables", value);
                        let updatedPermissions = updateTablesPermission(permissions, groupId, entityId, value, metadata);
                        return inferAndUpdateEntityPermissions(updatedPermissions, groupId, entityId, metadata);
                    },
                    postAction(groupId, { databaseId, schemaName }, value) {
                        if (value === "controlled") {
                            return push(`/admin/permissions/databases/${databaseId}/schemas/${encodeURIComponent(schemaName)}/tables`);
                        }
                    },
                    confirm(groupId, entityId, value) {
                        return [
                            getPermissionWarningModal(getTablesPermission, "tables", defaultGroup, permissions, groupId, entityId, value),
                            getControlledDatabaseWarningModal(permissions, groupId, entityId)
                        ];
                    },
                    warning(groupId, entityId) {
                        return getPermissionWarning(getTablesPermission, "tables", defaultGroup, permissions, groupId, entityId);
                    }
                }
            },
            entities: schemaNames.map(schemaName => ({
                id: {
                    databaseId,
                    schemaName
                },
                name: schemaName,
                link: { name: "View tables", url: `/admin/permissions/databases/${databaseId}/schemas/${encodeURIComponent(schemaName)}/tables`}
            }))
        }
    }
);

export const getDatabasesPermissionsGrid = createSelector(
    getMeta, getGroups, getPermissions,
    (metadata: Metadata, groups: Array<Group>, permissions: GroupsPermissions) => {
        if (!groups || !permissions || !metadata) {
            return null;
        }

        const databases = metadata.databases();
        const defaultGroup = _.find(groups, isDefaultGroup);

        return {
            type: "database",
            icon: "database",
            groups,
            permissions: {
                "schemas": {
                    header: "Data Access",
                    options(groupId, entityId) {
                        return [OPTION_ALL, OPTION_CONTROLLED, OPTION_NONE]
                    },
                    getter(groupId, entityId) {
                        return getSchemasPermission(permissions, groupId, entityId);
                    },
                    updater(groupId, entityId, value) {
                        MetabaseAnalytics.trackEvent("Permissions", "schemas", value);
                        return updateSchemasPermission(permissions, groupId, entityId, value, metadata)
                    },
                    postAction(groupId, { databaseId }, value) {
                        if (value === "controlled") {
                            let database = metadata.database(databaseId);
                            let schemas = database ? database.schemaNames() : [];
                            if (schemas.length === 0 || (schemas.length === 1 && schemas[0] === "")) {
                                return push(`/admin/permissions/databases/${databaseId}/tables`);
                            } else if (schemas.length === 1) {
                                return push(`/admin/permissions/databases/${databaseId}/schemas/${schemas[0]}/tables`);
                            } else {
                                return push(`/admin/permissions/databases/${databaseId}/schemas`);
                            }
                        }
                    },
                    confirm(groupId, entityId, value) {
                        return [
                            getPermissionWarningModal(getSchemasPermission, "schemas", defaultGroup, permissions, groupId, entityId, value),
                        ];
                    },
                    warning(groupId, entityId) {
                        return getPermissionWarning(getSchemasPermission, "schemas", defaultGroup, permissions, groupId, entityId);
                    }
                },
                "native": {
                    header: "SQL Queries",
                    options(groupId, entityId) {
                        if (getSchemasPermission(permissions, groupId, entityId) === "none") {
                            return [OPTION_NONE];
                        } else {
                            return [OPTION_NATIVE_WRITE, OPTION_NATIVE_READ, OPTION_NONE];
                        }
                    },
                    getter(groupId, entityId) {
                        return getNativePermission(permissions, groupId, entityId);
                    },
                    updater(groupId, entityId, value) {
                        MetabaseAnalytics.trackEvent("Permissions", "native", value);
                        return updateNativePermission(permissions, groupId, entityId, value, metadata);
                    },
                    confirm(groupId, entityId, value) {
                        return [
                            getPermissionWarningModal(getNativePermission, null, defaultGroup, permissions, groupId, entityId, value),
                            getRawQueryWarningModal(permissions, groupId, entityId, value)
                        ];
                    },
                    warning(groupId, entityId) {
                        return getPermissionWarning(getNativePermission, null, defaultGroup, permissions, groupId, entityId);
                    }
                },
            },
            entities: databases.map(database => {
                let schemas = database.schemaNames();
                return {
                    id: {
                        databaseId: database.id
                    },
                    name: database.name,
                    link:
                        schemas.length === 0 || (schemas.length === 1 && schemas[0] === "") ?
                            { name: "View tables", url: `/admin/permissions/databases/${database.id}/tables` }
                        : schemas.length === 1 ?
                            { name: "View tables", url: `/admin/permissions/databases/${database.id}/schemas/${schemas[0]}/tables` }
                        :
                            { name: "View schemas", url: `/admin/permissions/databases/${database.id}/schemas`}
                }
            })
        }
    }
);

const getCollections = (state) => state.admin.permissions.collections;
const getCollectionPermission = (permissions, groupId, { collectionId }) =>
    getIn(permissions, [groupId, collectionId]);

export const getCollectionsPermissionsGrid = createSelector(
    getCollections, getGroups, getPermissions,
    (collections, groups: Array<Group>, permissions: GroupsPermissions) => {
        if (!groups || !permissions || !collections) {
            return null;
        }

        const defaultGroup = _.find(groups, isDefaultGroup);

        return {
            type: "collection",
            icon: "collection",
            groups,
            permissions: {
                "access": {
                    options(groupId, entityId) {
                        return [OPTION_COLLECTION_WRITE, OPTION_COLLECTION_READ, OPTION_NONE];
                    },
                    getter(groupId, entityId) {
                        return getCollectionPermission(permissions, groupId, entityId);
                    },
                    updater(groupId, { collectionId }, value) {
                        return assocIn(permissions, [groupId, collectionId], value);
                    },
                    confirm(groupId, entityId, value) {
                        return [
                            getPermissionWarningModal(getCollectionPermission, null, defaultGroup, permissions, groupId, entityId, value)
                        ];
                    },
                    warning(groupId, entityId) {
                        return getPermissionWarning(getCollectionPermission, null, defaultGroup, permissions, groupId, entityId);
                    }
                },
            },
            entities: collections.map(collection => {
                return {
                    id: {
                        collectionId: collection.id
                    },
                    name: collection.name
                }
            })
        }
    }
);

export const getDiff = createSelector(
    getMeta, getGroups, getPermissions, getOriginalPermissions,
    (metadata: Metadata, groups: Array<Group>, permissions: GroupsPermissions, originalPermissions: GroupsPermissions) =>
        diffPermissions(permissions, originalPermissions, groups, metadata)
);
