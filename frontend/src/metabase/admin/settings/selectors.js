import _ from "underscore";
import { createSelector } from "reselect";
import MetabaseSettings from "metabase/lib/settings";

import { slugify } from "metabase/lib/formatting";
import CustomGeoJSONWidget from "./components/widgets/CustomGeoJSONWidget.jsx";
import {
    PublicLinksDashboardListing,
    PublicLinksQuestionListing,
    EmbeddedQuestionListing,
    EmbeddedDashboardListing
} from "./components/widgets/PublicLinksListing.jsx";
import SecretKeyWidget from "./components/widgets/SecretKeyWidget.jsx";
import EmbeddingLegalese from "./components/widgets/EmbeddingLegalese";

import { UtilApi } from "metabase/services";

const SECTIONS = [
    {
        name: "Setup",
        settings: []
    },
    {
        name: "常用设置",
        settings: [
            {
                key: "网站名",
                display_name: "Site Name",
                type: "string"
            },
            {
                key: "网站地址",
                display_name: "Site URL",
                type: "string"
            },
            {
                key: "管理员邮箱",
                display_name: "用以接收使用反馈",
                type: "string"
            },
            {
                key: "report-timezone",
                display_name: "时区设置",
                type: "select",
                options: [
                    { name: "Database Default", value: "" },
                    ...MetabaseSettings.get('timezones')
                ],
                placeholder: "Select a timezone",
                note: "Not all databases support timezones, in which case this setting won't take effect.",
                allowValueCollection: true
            },
            {
                key: "anon-tracking-enabled",
                display_name: "追踪反馈",
                type: "boolean"
            },
            {
                key: "enable-advanced-humanization",
                display_name: "Friendly Table and Field Names",
                type: "boolean"
            }
        ]
    },
    {
        name: "更新",
        settings: [
            {
                key: "check-for-updates",
                display_name: "检查更新",
                type: "boolean"
            }
        ]
    },
    {
        name: "邮箱服务设置",
        settings: [
            {
                key: "email-smtp-host",
                display_name: "SMTP Host",
                placeholder: "smtp.yourservice.com",
                type: "string",
                required: true,
                autoFocus: true
            },
            {
                key: "email-smtp-port",
                display_name: "SMTP Port",
                placeholder: "587",
                type: "number",
                required: true,
                validations: [["integer", "That's not a valid port number"]]
            },
            {
                key: "email-smtp-security",
                display_name: "SMTP Security",
                description: null,
                type: "radio",
                options: { none: "None", ssl: "SSL", tls: "TLS", starttls: "STARTTLS" },
                defaultValue: 'none'
            },
            {
                key: "email-smtp-username",
                display_name: "SMTP Username",
                description: null,
                placeholder: "youlooknicetoday",
                type: "string"
            },
            {
                key: "email-smtp-password",
                display_name: "SMTP Password",
                description: null,
                placeholder: "Shh...",
                type: "password"
            },
            {
                key: "email-from-address",
                display_name: "From Address",
                placeholder: "metabase@yourcompany.com",
                type: "string",
                required: true,
                validations: [["email", "That's not a valid email address"]]
            }
        ]
    },
    {
        name: "Slack",
        settings: [
            {
                key: "slack-token",
                display_name: "Slack API Token",
                description: "",
                placeholder: "Enter the token you received from Slack",
                type: "string",
                required: false,
                autoFocus: true
            },
            {
                key: "metabot-enabled",
                display_name: "MetaBot",
                type: "boolean",
                // TODO: why do we have "defaultValue" in addition to "default" in the backend?
                defaultValue: false,
                required: true,
                autoFocus: false
            },
        ]
    },
    {
        name: "谷歌身份验证群登录设置",
        settings: [
            {
                key: "google-auth-client-id"
            },
            {
                key: "google-auth-auto-create-accounts-domain"
            }
        ]
    },
    {
        name: "地图",
        settings: [
            {
                key: "map-tile-server-url",
                display_name: "地图服务器地址",
                note: "Metabase 使用默认的地图服务器.",
                type: "string"
            },
            {
                key: "custom-geojson",
                display_name: "自定义地图",
                description: "使用自定义的JSONgeo数据",
                widget: CustomGeoJSONWidget,
                noHeader: true
            }
        ]
    },
    {
        name: "共享数据",
        settings: [
            {
                key: "enable-public-sharing",
                display_name: "是否允许共享",
                type: "boolean"
            },
            {
                key: "-public-sharing-dashboards",
                display_name: "共享仪表板",
                widget: PublicLinksDashboardListing,
                getHidden: (settings) => !settings["enable-public-sharing"]
            },
            {
                key: "-public-sharing-questions",
                display_name: "共享问题",
                widget: PublicLinksQuestionListing,
                getHidden: (settings) => !settings["enable-public-sharing"]
            }
        ]
    },
    {
        name: "嵌入到其他软件",
        settings: [
            {
                key: "enable-embedding",
                description: null,
                widget: EmbeddingLegalese,
                getHidden: (settings) => settings["enable-embedding"],
                onChanged: async (oldValue, newValue, settingsValues, onChange) => {
                    if (!oldValue && newValue && !settingsValues["embedding-secret-key"]) {
                        let result = await UtilApi.random_token();
                        await onChange("embedding-secret-key", result.token);
                    }
                }
            },
            {
                key: "enable-embedding",
                display_name: "是否允许嵌入",
                type: "boolean",
                getHidden: (settings) => !settings["enable-embedding"]
            },
            {
                key: "embedding-secret-key",
                display_name: "秘钥",
                widget: SecretKeyWidget,
                getHidden: (settings) => !settings["enable-embedding"]
            },
            {
                key: "-embedded-dashboards",
                display_name: "是否允许嵌入仪表板",
                widget: EmbeddedDashboardListing,
                getHidden: (settings) => !settings["enable-embedding"]
            },
            {
                key: "-embedded-questions",
                display_name: "是否允许嵌入问题查询",
                widget: EmbeddedQuestionListing,
                getHidden: (settings) => !settings["enable-embedding"]
            }
        ]
    },
    {
        name: "Caching",
        settings: [
            {
                key: "enable-query-caching",
                display_name: "缓存设置",
                type: "boolean"
            },
            {
                key: "query-caching-min-ttl",
                display_name: "查询超时",
                type: "number",
                getHidden: (settings) => !settings["enable-query-caching"],
                allowValueCollection: true
            },
            {
                key: "query-caching-ttl-ratio",
                display_name: "Cache Time-To-Live (TTL) multiplier",
                type: "number",
                getHidden: (settings) => !settings["enable-query-caching"],
                allowValueCollection: true
            },
            {
                key: "query-caching-max-kb",
                display_name: "最大缓存",
                type: "number",
                getHidden: (settings) => !settings["enable-query-caching"],
                allowValueCollection: true
            }
        ]
    }
];
for (const section of SECTIONS) {
    section.slug = slugify(section.name);
}

export const getSettings = createSelector(
    state => state.settings.settings,
    state => state.admin.settings.warnings,
    (settings, warnings) =>
        settings.map(setting => warnings[setting.key] ?
            { ...setting, warning: warnings[setting.key] } :
            setting
        )
)

export const getSettingValues = createSelector(
    getSettings,
    (settings) => {
        const settingValues = {};
        for (const setting of settings) {
            settingValues[setting.key] = setting.value;
        }
        return settingValues;
    }
)

export const getNewVersionAvailable = createSelector(
    getSettings,
    (settings) => {
        return MetabaseSettings.newVersionAvailable(settings);
    }
);

export const getSections = createSelector(
    getSettings,
    (settings) => {
        if (!settings || _.isEmpty(settings)) {
            return [];
        }

        let settingsByKey = _.groupBy(settings, 'key');
        return SECTIONS.map(function(section) {
            let sectionSettings = section.settings.map(function(setting) {
                const apiSetting = settingsByKey[setting.key] && settingsByKey[setting.key][0];
                if (apiSetting) {
                    return {
                        placeholder: apiSetting.default,
                        ...apiSetting,
                        ...setting
                    };
                } else {
                    return setting;
                }
            });
            return {
                ...section,
                settings: sectionSettings
            };
        });
    }
);

export const getActiveSectionName = (state, props) => props.params.section

export const getActiveSection = createSelector(
    getActiveSectionName,
    getSections,
    (section = "setup", sections) => {
        if (sections) {
            return _.findWhere(sections, { slug: section });
        } else {
            return null;
        }
    }
);
