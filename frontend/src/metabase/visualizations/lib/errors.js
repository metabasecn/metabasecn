/* @flow */

import { inflect } from "metabase/lib/formatting";

// NOTE: extending Error with Babel requires babel-plugin-transform-builtin-extend

export class MinColumnsError extends Error {
    constructor(minColumns: number, actualColumns: number) {
        super(`查询中的数据不适合所选择的显示选项。这种可视化至少需要: ${actualColumns} ${inflect("column", actualColumns)} 数据.`);
    }
}

export class MinRowsError extends Error {
    constructor(minRows: number, actualRows: number) {
        super(` ${actualRows}  ${inflect("point", actualRows)} 没有足够得数据供可视化展现`);
    }
}

export class LatitudeLongitudeError extends Error {
    constructor() {
        super("无法画出地图，因为我们需要经纬度列。");
    }
}

export class ChartSettingsError extends Error {
    section: ?string;
    buttonText: ?string;
    constructor(message: string, section?: string, buttonText?: string) {
        super(message || "请在图表设置中配置此图表:");
        this.section = section;
        this.buttonText = buttonText || "配置图表";
    }
}
