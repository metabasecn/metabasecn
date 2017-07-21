import { capitalize } from "metabase/lib/formatting";
import { isDimension, isMetric, isNumeric, isAny } from "metabase/lib/schema_metadata";

import { columnsAreValid, getDefaultColumns, getOptionFromColumn } from "metabase/visualizations/lib/settings";
import { getCardColors, getFriendlyName } from "metabase/visualizations/lib/utils";
import { dimensionIsNumeric } from "metabase/visualizations/lib/numeric";
import { dimensionIsTimeseries } from "metabase/visualizations/lib/timeseries";

import _ from "underscore";

function getSeriesTitles(series, vizSettings) {
    return series.map(s => s.card.name);
}

export const GRAPH_DATA_SETTINGS = {
  "graph._dimension_filter": {
      getDefault: ([{ card }]) => card.display === "scatter" ? isAny : isDimension,
      useRawSeries: true
  },
  "graph._metric_filter": {
      getDefault: ([{ card }]) => card.display === "scatter" ? isNumeric : isMetric,
      useRawSeries: true
  },
  "graph.dimensions": {
      section: "Data",
      title: "X-axis",
      widget: "fields",
      isValid: ([{ card, data }], vizSettings) =>
          columnsAreValid(card.visualization_settings["graph.dimensions"], data, vizSettings["graph._dimension_filter"]) &&
          columnsAreValid(card.visualization_settings["graph.metrics"], data, vizSettings["graph._metric_filter"]),
      getDefault: (series, vizSettings) =>
          getDefaultColumns(series).dimensions,
      getProps: ([{ card, data }], vizSettings) => {
          const value = vizSettings["graph.dimensions"];
          const options = data.cols.filter(vizSettings["graph._dimension_filter"]).map(getOptionFromColumn);
          return {
              options,
              addAnother: (options.length > value.length && value.length < 2 && vizSettings["graph.metrics"].length < 2) ?
                  "添加列数据..." : null
          };
      },
      readDependencies: ["graph._dimension_filter", "graph._metric_filter"],
      writeDependencies: ["graph.metrics"],
      dashboard: false,
      useRawSeries: true
  },
  "graph.metrics": {
      section: "Data",
      title: "Y-axis",
      widget: "fields",
      isValid: ([{ card, data }], vizSettings) =>
          columnsAreValid(card.visualization_settings["graph.dimensions"], data, vizSettings["graph._dimension_filter"]) &&
          columnsAreValid(card.visualization_settings["graph.metrics"], data, vizSettings["graph._metric_filter"]),
      getDefault: (series, vizSettings) =>
          getDefaultColumns(series).metrics,
      getProps: ([{ card, data }], vizSettings) => {
          const value = vizSettings["graph.dimensions"];
          const options = data.cols.filter(vizSettings["graph._metric_filter"]).map(getOptionFromColumn);
          return {
              options,
              addAnother: options.length > value.length && vizSettings["graph.dimensions"].length < 2 ?
                  "添加列数据" : null
          };
      },
      readDependencies: ["graph._dimension_filter", "graph._metric_filter"],
      writeDependencies: ["graph.dimensions"],
      dashboard: false,
      useRawSeries: true
  },
};

export const GRAPH_BUBBLE_SETTINGS = {
    "scatter.bubble": {
        section: "Data",
        title: "气泡大小",
        widget: "field",
        isValid: ([{ card, data }], vizSettings) =>
            columnsAreValid([card.visualization_settings["scatter.bubble"]], data, isNumeric),
        getDefault: (series) =>
            getDefaultColumns(series).bubble,
        getProps: ([{ card, data }], vizSettings, onChange) => {
            const options = data.cols.filter(isNumeric).map(getOptionFromColumn);
            return {
                options,
                onRemove: vizSettings["scatter.bubble"] ? () => onChange(null) : null
            };
        },
        writeDependencies: ["graph.dimensions"],
        dashboard: false,
        useRawSeries: true
    },
}

export const LINE_SETTINGS = {
  "line.interpolate": {
      section: "Display",
      title: "显示样式",
      widget: "select",
      props: {
          options: [
              { name: "直线", value: "linear" },
              { name: "圆滑曲线", value: "cardinal" },
              { name: "步进直线", value: "step-after" },
          ]
      },
      getDefault: () => "linear"
  },
  "line.marker_enabled": {
      section: "Display",
      title: "显示曲线点标记",
      widget: "toggle"
  },
}

export const STACKABLE_SETTINGS = {
  "stackable.stack_type": {
      section: "Display",
      title: "堆叠",
      widget: "radio",
      getProps: (series, vizSettings) => ({
          options: [
              { name: "Don't stack", value: null },
              { name: "Stack", value: "stacked" },
              { name: "Stack - 100%", value: "normalized" }
          ]
      }),
      getDefault: ([{ card, data }], vizSettings) =>
          // legacy setting and default for D-M-M+ charts
          vizSettings["stackable.stacked"] || (card.display === "area" && vizSettings["graph.metrics"].length > 1) ?
              "stacked" : null,
      getHidden: (series) =>
          series.length < 2,
      readDependencies: ["graph.metrics"]
  }
}

export const GRAPH_GOAL_SETTINGS = {
  "graph.show_goal": {
      section: "Display",
      title: "显示标线",
      widget: "toggle",
      default: false
  },
  "graph.goal_value": {
      section: "Display",
      title: "标线值",
      widget: "number",
      default: 0,
      getHidden: (series, vizSettings) => vizSettings["graph.show_goal"] !== true,
      readDependencies: ["graph.show_goal"]
  },
}

export const LINE_SETTINGS_2 = {
  "line.missing": {
      section: "Display",
      title: "缺失数据替换",
      widget: "select",
      default: "interpolate",
      getProps: (series, vizSettings) => ({
          options: [
              { name: "替换为0", value: "zero" },
              { name: "替换为空值", value: "none" },
              { name: "线性插值", value: "interpolate" },
          ]
      })
  },
}

export const GRAPH_COLORS_SETTINGS = {
  "graph.colors": {
      section: "Display",
      getTitle: ([{ card: { display } }]) =>
          capitalize(display === "scatter" ? "bubble" : display) + " colors",
      widget: "colors",
      readDependencies: ["graph.dimensions", "graph.metrics"],
      getDefault: ([{ card, data }], vizSettings) => {
          return getCardColors(card);
      },
      getProps: (series, vizSettings) => {
          return { seriesTitles: getSeriesTitles(series, vizSettings) };
      }
  }
}

export const GRAPH_AXIS_SETTINGS = {
  "graph.x_axis._is_timeseries": {
      readDependencies: ["graph.dimensions"],
      getDefault: ([{ data }], vizSettings) =>
          dimensionIsTimeseries(data, _.findIndex(data.cols, (c) => c.name === vizSettings["graph.dimensions"].filter(d => d)[0]))
  },
  "graph.x_axis._is_numeric": {
      readDependencies: ["graph.dimensions"],
      getDefault: ([{ data }], vizSettings) =>
          dimensionIsNumeric(data, _.findIndex(data.cols, (c) => c.name === vizSettings["graph.dimensions"].filter(d => d)[0]))
  },
  "graph.x_axis.scale": {
      section: "Axes",
      title: "X轴类型",
      widget: "select",
      default: "ordinal",
      readDependencies: ["graph.x_axis._is_timeseries", "graph.x_axis._is_numeric"],
      getDefault: (series, vizSettings) =>
          vizSettings["graph.x_axis._is_timeseries"] ? "timeseries" :
          vizSettings["graph.x_axis._is_numeric"] ? "linear" :
          "ordinal",
      getProps: (series, vizSettings) => {
          const options = [];
          if (vizSettings["graph.x_axis._is_timeseries"]) {
              options.push({ name: "时间序列", value: "timeseries" });
          }
          if (vizSettings["graph.x_axis._is_numeric"]) {
              options.push({ name: "等差轴", value: "linear" });
              options.push({ name: "等比轴", value: "pow" });
              options.push({ name: "对数轴", value: "log" });
          }
          options.push({ name: "正常轴", value: "ordinal" });
          return { options };
      }
  },
  "graph.y_axis.scale": {
      section: "Axes",
      title: "Y轴尺寸",
      widget: "select",
      default: "linear",
      getProps: (series, vizSettings) => ({
          options: [
              { name: "等差轴", value: "linear" },
              { name: "等比轴", value: "pow" },
              { name: "对数轴", value: "log" }
          ]
      })
  },
  "graph.x_axis.axis_enabled": {
      section: "Axes",
      title: "显示x轴线和标记",
      widget: "toggle",
      default: true
  },
  "graph.y_axis.axis_enabled": {
      section: "Axes",
      title: "显示y轴线和标记",
      widget: "toggle",
      default: true
  },
  "graph.y_axis.auto_range": {
      section: "Axes",
      title: "自动调整Y轴范围",
      widget: "toggle",
      default: true
  },
  "graph.y_axis.min": {
      section: "Axes",
      title: "最小值",
      widget: "number",
      default: 0,
      getHidden: (series, vizSettings) => vizSettings["graph.y_axis.auto_range"] !== false
  },
  "graph.y_axis.max": {
      section: "Axes",
      title: "最大值",
      widget: "number",
      default: 100,
      getHidden: (series, vizSettings) => vizSettings["graph.y_axis.auto_range"] !== false
  },
/*
  "graph.y_axis_right.auto_range": {
      section: "Axes",
      title: "Auto right-hand y-axis range",
      widget: "toggle",
      default: true
  },
  "graph.y_axis_right.min": {
      section: "Axes",
      title: "Min",
      widget: "number",
      default: 0,
      getHidden: (series, vizSettings) => vizSettings["graph.y_axis_right.auto_range"] !== false
  },
  "graph.y_axis_right.max": {
      section: "Axes",
      title: "Max",
      widget: "number",
      default: 100,
      getHidden: (series, vizSettings) => vizSettings["graph.y_axis_right.auto_range"] !== false
  },
*/
  "graph.y_axis.auto_split": {
      section: "Axes",
      title: "必要时使用分割y轴",
      widget: "toggle",
      default: true,
      getHidden: (series) => series.length < 2
  },
  "graph.x_axis.labels_enabled": {
      section: "Labels",
      title: "显示轴标签",
      widget: "toggle",
      default: true
  },
  "graph.x_axis.title_text": {
      section: "Labels",
      title: "X轴标签",
      widget: "input",
      getHidden: (series, vizSettings) =>
          vizSettings["graph.x_axis.labels_enabled"] === false,
      getDefault: (series, vizSettings) =>
          series.length === 1 ? getFriendlyName(series[0].data.cols[0]) : null
  },
  "graph.y_axis.labels_enabled": {
      section: "Labels",
      title: "显示Y轴标签",
      widget: "toggle",
      default: true
  },
  "graph.y_axis.title_text": {
      section: "Labels",
      title: "Y轴标签",
      widget: "input",
      getHidden: (series, vizSettings) =>
          vizSettings["graph.y_axis.labels_enabled"] === false,
      getDefault: (series, vizSettings) =>
          series.length === 1 ? getFriendlyName(series[0].data.cols[1]) : null
  },
}
