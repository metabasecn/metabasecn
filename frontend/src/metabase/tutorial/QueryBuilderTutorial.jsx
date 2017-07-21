/* eslint-disable react/display-name */

import React, { Component } from "react";

import Tutorial, { qs, qsWithContent } from "./Tutorial.jsx";

import RetinaImage from "react-retina-image";

const QUERY_BUILDER_STEPS = [
    {
        getPortalTarget: () => qs(".GuiBuilder"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage className="mb2" forceOriginalDimensions={false} src="app/assets/img/qb_tutorial/question_builder.png" width={186} />
                <h3>Welcome to the Query Builder!</h3>
                <p>The Query Builder lets you assemble questions (or "queries") to ask about your data.</p>
                <a className="Button Button--primary" onClick={props.onNext}>Tell me more</a>
            </div>
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-data"),
        getModalTarget: () => qs(".GuiBuilder-data"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage id="QB-TutorialTableImg" className="mb2" forceOriginalDimensions={false} src="app/assets/img/qb_tutorial/table.png" width={157} />
                <h3>Start by picking the table with the data that you have a question about.</h3>
                <p>Go ahead and select the "Orders" table from the dropdown menu.</p>
            </div>,
        shouldAllowEvent: (e) => qs(".GuiBuilder-data a").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-data"),
        getPageFlagTarget: () => qsWithContent(".List-section-header", "Sample Dataset"),
        shouldAllowEvent: (e) => qsWithContent(".List-section-header", "Sample Dataset").contains(e.target),
        optional: true
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-data"),
        getPageFlagTarget: () => qsWithContent(".List-item", "Orders"),
        shouldAllowEvent: (e) => qsWithContent(".List-item > a", "Orders").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-filtered-by"),
        getModalTarget: () => qs(".GuiBuilder-filtered-by"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialFunnelImg"
                    src="app/assets/img/qb_tutorial/funnel.png"
                    width={135}
                />
                <h3>Filter your data to get just what you want.</h3>
                <p>Click the plus button and select the "Created At" field.</p>
            </div>,
        shouldAllowEvent: (e) => qs(".GuiBuilder-filtered-by a").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-filtered-by"),
        getPageFlagTarget: () => qsWithContent(".List-item", "Created At"),
        shouldAllowEvent: (e) => qsWithContent(".List-item > a", "Created At").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-filtered-by"),
        getPageFlagText: () => "Here we can pick how many days we want to see data for, try 10",
        getPageFlagTarget: () => qs('[data-ui-tag="relative-date-input"]'),
        shouldAllowEvent: (e) => qs('[data-ui-tag="relative-date-input"]').contains(e.target)
    },
    {
        getPortalTarget: () => qs(".GuiBuilder-filtered-by"),
        getPageFlagTarget: () => qs('[data-ui-tag="add-filter"]'),
        shouldAllowEvent: (e) => qs('[data-ui-tag="add-filter"]').contains(e.target)
    },
    {
        getPortalTarget: () => qs(".Query-section-aggregation"),
        getModalTarget: () => qs(".Query-section-aggregation"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialCalculatorImg"
                    src="app/assets/img/qb_tutorial/calculator.png"
                    width={115}
                />
                <h3>
                在这里您可以选择添加或平均数据，计算表中的行数，或者只查看原始数据。</h3>
                <p>尝试: 点击 <strong>行数据</strong> 改变为<strong>行总数</strong>

这样我们就可以计算出这张表有多少个订单了。 </p>
            </div>,
        shouldAllowEvent: (e) => qs('.View-section-aggregation').contains(e.target)
    },
    {
        getPortalTarget: () => qs(".Query-section-aggregation"),
        getPageFlagTarget: () => qsWithContent(".List-item", "Count of rows"),
        shouldAllowEvent: (e) => qsWithContent(".List-item > a", "Count of rows").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".Query-section-breakout"),
        getModalTarget: () => qs(".Query-section-breakout"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialBananaImg"
                    src="app/assets/img/qb_tutorial/banana.png"
                    width={232}
                />
                <h3>

添加一个分组，按类别、日期、月份和更多来分解结果。 .</h3>
                <p>尝试: 点击<strong>添加一个分组</strong>, 并选择 <strong>分组条件:根据周分组</strong>.</p>
            </div>,
        shouldAllowEvent: (e) => qs('.Query-section-breakout').contains(e.target)
    },
    {
        getPortalTarget: () => qs(".Query-section-breakout"),
        getPageFlagTarget: () => qs(".FieldList-grouping-trigger"),
        getPageFlagText: () => "Click on \"by day\" to change it to \"Week.\"",
        shouldAllowEvent: (e) => qs(".FieldList-grouping-trigger").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".Query-section-breakout"),
        getPageFlagTarget: () => qsWithContent(".List-item", "Week"),
        shouldAllowEvent: (e) => qsWithContent(".List-item > a", "Week").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".RunButton"),
        getModalTarget: () => qs(".RunButton"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialRocketImg"
                    src="app/assets/img/qb_tutorial/rocket.png"
                    width={217}
                />
                <h3>Run Your Query.</h3>
                <p>You're doing so well! Click <strong>Run query</strong> to get your results!</p>
            </div>,
        shouldAllowEvent: (e) => qs(".RunButton").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".VisualizationSettings"),
        getModalTarget: () => qs(".VisualizationSettings"),
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialChartImg"
                    src="app/assets/img/qb_tutorial/chart.png"
                    width={160}
                />
                <h3>

您可以将结果视为图表而不是表。 </h3>
                <p>生成更直观的图表! 点击 <strong>可视化</strong> 下拉列表并且选择 <strong>曲线</strong>.</p>
            </div>,
        shouldAllowEvent: (e) => qs(".VisualizationSettings a").contains(e.target)
    },
    {
        getPortalTarget: () => qs(".VisualizationSettings"),
        getPageFlagTarget: () => qsWithContent(".ChartType-popover li", "Line"),
        shouldAllowEvent: (e) => qsWithContent(".ChartType-popover li", "Line").contains(e.target)
    },
    {
        getPortalTarget: () => true,
        getModal: (props) =>
            <div className="text-centered">
                <RetinaImage
                    className="mb2"
                    forceOriginalDimensions={false}
                    id="QB-TutorialBoatImg"
                    src="app/assets/img/qb_tutorial/boat.png" width={190}
                />
                <h3>Well done!</h3>
                <p>这是你的所有答案，查看更多示例教程 <a className="link" target="_blank" href="http://www.metabase.com/docs/latest/users-guide/start">User's Guide</a>. 探索您的数据吧!</p>
                <a className="Button Button--primary" onClick={props.onNext}>感谢您的试用!</a>
            </div>
    },
    {
        getModalTarget: () => qsWithContent(".Header-buttonSection a", "Save"),
        getModal: (props) =>
            <div className="text-centered">
                <h3>保存您的问题!</h3>
                <p>另外，你可以保存你的问题，以便以后可以参考。保存的问题，也可以放在仪表板或脉冲。</p>
                <a className="Button Button--primary" onClick={props.onClose}>Sounds good</a>
            </div>
    }
]

export default class QueryBuilderTutorial extends Component {
    render() {
        return <Tutorial steps={QUERY_BUILDER_STEPS} {...this.props} />;
    }
}
