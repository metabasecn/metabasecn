import React, { Component } from "react";
import { Link } from "react-router";

import FormLabel from "../components/FormLabel.jsx";
import FormInput from "../components/FormInput.jsx";
import FormTextArea from "../components/FormTextArea.jsx";
import FieldSet from "metabase/components/FieldSet.jsx";
import PartialQueryBuilder from "../components/PartialQueryBuilder.jsx";
import LoadingAndErrorWrapper from "metabase/components/LoadingAndErrorWrapper.jsx";

import { formatValue } from "metabase/lib/formatting";

import { metricFormSelectors } from "../selectors";
import { reduxForm } from "redux-form";

import Query from "metabase/lib/query";

import cx from "classnames";

@reduxForm({
    form: "metric",
    fields: ["id", "name", "description", "table_id", "definition", "revision_message", "show_in_getting_started"],
    validate: (values) => {
        const errors = {};
        if (!values.name) {
            errors.name = "Name is required";
        }
        if (!values.description) {
            errors.description = "Description is required";
        }
        if (values.id != null) {
            if (!values.revision_message) {
                errors.revision_message = "Revision message is required";
            }
        }
        let aggregations = values.definition && Query.getAggregations(values.definition);
        if (!aggregations || aggregations.length === 0) {
            errors.definition = "Aggregation is required";
        }
        return errors;
    }
},
(state, props) => metricFormSelectors(state, props))
export default class MetricForm extends Component {
    updatePreviewSummary(datasetQuery) {
        this.props.updatePreviewSummary({
            ...datasetQuery,
            query: {
                aggregation: ["count"],
                ...datasetQuery.query,
            }
        })
    }

    renderActionButtons() {
        const { invalid, handleSubmit, tableMetadata } = this.props;
        return (
            <div>
                <button className={cx("Button", { "Button--primary": !invalid, "disabled": invalid })} onClick={handleSubmit}>Save changes</button>
                <Link to={"/admin/datamodel/database/" + tableMetadata.db_id + "/table/" + tableMetadata.id} className="Button Button--borderless mx1">Cancel</Link>
            </div>
        )
    }

    render() {
        const { fields: { id, name, description, definition, revision_message }, metric, tableMetadata, handleSubmit, previewSummary } = this.props;

        return (
            <LoadingAndErrorWrapper loading={!tableMetadata}>
            { () =>
                <form className="full" onSubmit={handleSubmit}>
                    <div className="wrapper py4">
                        <FormLabel
                            title={(metric && metric.id != null ? "Edit" : "Create") + " Your Metric"}
                            description={metric && metric.id != null ?
                                " 对度量值进行更改并留下解释性注释。 " :
                                " 您可以创建保存的度量值以将命名的度量选项添加到该表中。保存的度量值包括聚合类型、聚合字段，以及可选的添加的筛选器。作为一个例子，您可以使用这个来创建一个类似于计算订单表的“平均价格”的官方方法。 "
                            }
                        >
                        <PartialQueryBuilder
                            features={{
                                filter: true,
                                aggregation: true
                            }}
                            tableMetadata={{
                                ...tableMetadata,
                                aggregation_options: tableMetadata.aggregation_options.filter(a => a.short !== "rows"),
                                metrics: null
                            }}
                            previewSummary={previewSummary == null ? "" : "Result: " + formatValue(previewSummary)}
                            updatePreviewSummary={this.updatePreviewSummary.bind(this)}
                            {...definition}
                        />
                        </FormLabel>
                        <div style={{ maxWidth: "575px" }}>
                            <FormLabel
                                title=" 命名您的度量 "
                                description=" 给你的公制一个名称，帮助别人找到它。 "
                            >
                                <FormInput
                                    field={name}
                                    placeholder="描述，不能太长"
                                />
                            </FormLabel>
                            <FormLabel
                                title="Describe Your Metric"
                                description=" 给你的指标一个描述，帮助别人了解它是什么。 "
                            >
                                <FormTextArea
                                    field={description}
                                    placeholder=" 这是一个很好的地方来更详细地说明不太明显的度量规则。 "
                                />
                            </FormLabel>
                            { id.value != null &&
                                <FieldSet legend="改变原因">
                                    <FormLabel description="做了什么改变以及为什么这样更改。 ">
                                        <FormTextArea
                                            field={revision_message}
                                            placeholder=" 这将出现在这个度量的修订历史中，以帮助大家记住为什么改变了。 "
                                        />
                                    </FormLabel>
                                    <div className="flex align-center">
                                        {this.renderActionButtons()}
                                    </div>
                                </FieldSet>
                            }
                        </div>
                    </div>

                    { id.value == null &&
                        <div className="border-top py4">
                            <div className="wrapper">
                                {this.renderActionButtons()}
                            </div>
                        </div>
                    }
                </form>
            }
            </LoadingAndErrorWrapper>
        );
    }
}
