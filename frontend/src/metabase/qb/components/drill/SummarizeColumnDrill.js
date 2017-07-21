/* @flow */

import { summarize, getFieldRefFromColumn } from "metabase/qb/lib/actions";
import * as Card from "metabase/meta/Card";
import { isNumeric } from "metabase/lib/schema_metadata";

import type {
    ClickAction,
    ClickActionProps
} from "metabase/meta/types/Visualization";

const AGGREGATIONS = {
    sum: {
        section: "sum",
        title: "求和"
    },
    avg: {
        section: "averages",
        title: "求平均"
    },
    min: {
        section: "averages",
        title: "最小值"
    },
    max: {
        section: "averages",
        title: "最大值"
    },
    distinct: {
        section: "averages",
        title: "不同的值"
    }
};

export default (
    { card, tableMetadata, clicked }: ClickActionProps
): ClickAction[] => {
    const query = Card.getQuery(card);

    if (
        !query ||
        !clicked ||
        !clicked.column ||
        clicked.value !== undefined ||
        clicked.column.source !== "fields" ||
        !isNumeric(clicked.column)
    ) {
        return [];
    }
    const { column } = clicked;

    // $FlowFixMe
    return Object.entries(AGGREGATIONS).map(([aggregation, action]: [string, {
        section: string,
        title: string
    }]) => ({
        name: action.title.toLowerCase(),
        ...action,
        card: () =>
            summarize(
                card,
                [aggregation, getFieldRefFromColumn(column)],
                tableMetadata
            )
    }));
};
