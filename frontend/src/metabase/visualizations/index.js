/* @flow weak */

import Scalar      from "./visualizations/Scalar.jsx";
import Progress    from "./visualizations/Progress.jsx";
import Table       from "./visualizations/Table.jsx";
import LineChart   from "./visualizations/LineChart.jsx";
import BarChart    from "./visualizations/BarChart.jsx";
import RowChart    from "./visualizations/RowChart.jsx";
import PieChart    from "./visualizations/PieChart.jsx";
import AreaChart   from "./visualizations/AreaChart.jsx";
import MapViz      from "./visualizations/Map.jsx";
import ScatterPlot from "./visualizations/ScatterPlot.jsx";
import Funnel      from "./visualizations/Funnel.jsx";

import _ from "underscore";

import type { Series } from "metabase/meta/types/Visualization";

const visualizations = new Map();
const aliases = new Map();
// $FlowFixMe
visualizations.get = function(key) {
    return Map.prototype.get.call(this, key) || aliases.get(key) || Table;
}

export function registerVisualization(visualization) {
    let identifier = visualization.identifier;
    if (identifier == null) {
        throw new Error("可视化必须定义一个“标识符”静态变量。: " + visualization.name);
    }
    if (visualizations.has(identifier)) {
        throw new Error("具有该标识符的可视化已经注册: " + visualization.name);
    }
    visualizations.set(identifier, visualization);
    for (let alias of visualization.aliases || []) {
        aliases.set(alias, visualization);
    }
}

export function getVisualizationRaw(series: Series) {
    return {
        series: series,
        CardVisualization: visualizations.get(series[0].card.display)
    };
}

export function getVisualizationTransformed(series: Series) {
    // don't transform if we don't have the data
    if (_.any(series, s => s.data == null)) {
        return getVisualizationRaw(series);
    }

    // if a visualization has a transformSeries function, do the transformation until it returns the same visualization / series
    let CardVisualization, lastSeries;
    do {
        CardVisualization = visualizations.get(series[0].card.display);
        if (!CardVisualization) {
            throw new Error("没有合适数据供可视化: " + series[0].card.display);
        }
        lastSeries = series;
        if (typeof CardVisualization.transformSeries === "function") {
            series = CardVisualization.transformSeries(series);
        }
        if (series !== lastSeries) {
            // $FlowFixMe
            series = [...series];
            // $FlowFixMe
            series._raw = lastSeries;
        }
    } while (series !== lastSeries);

    return { series, CardVisualization };
}

registerVisualization(Scalar);
registerVisualization(Progress);
registerVisualization(Table);
registerVisualization(LineChart);
registerVisualization(AreaChart);
registerVisualization(BarChart);
registerVisualization(RowChart);
registerVisualization(ScatterPlot);
registerVisualization(PieChart);
registerVisualization(MapViz);
registerVisualization(Funnel);

export default visualizations;
