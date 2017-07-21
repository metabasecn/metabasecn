import React, { Component } from "react";
import { Link } from "react-router";

import FormLabel from "../components/FormLabel.jsx";
import FormInput from "../components/FormInput.jsx";
import FormTextArea from "../components/FormTextArea.jsx";
import FieldSet from "metabase/components/FieldSet.jsx";
import PartialQueryBuilder from "../components/PartialQueryBuilder.jsx";
import LoadingAndErrorWrapper from "metabase/components/LoadingAndErrorWrapper.jsx";

import { formatValue } from "metabase/lib/formatting";

import { segmentFormSelectors } from "../selectors";
import { reduxForm } from "redux-form";

import cx from "classnames";

@reduxForm({
    form: "segment",
    fields: ["id", "name", "description", "table_id", "definition", "revision_message"],
    validate: (values) => {
        const errors = {};
        if (!values.name) {
            errors.name = "请填写名字";
        }
        if (!values.description) {
            errors.description = "请填写描述信息";
        }
        if (values.id != null) {
            if (!values.revision_message) {
                errors.revision_message = "请填写修改消息";
            }
        }
        if (!values.definition || !values.definition.filter || values.definition.filter.length < 1) {
            errors.definition = "至少需要一个过滤器。";
        }
        return errors;
    },
    initialValues: { name: "", description: "", table_id: null, definition: { filter: [] }, revision_message: null }
},
(state, props) => segmentFormSelectors(state, props))
export default class SegmentForm extends Component {
    updatePreviewSummary(datasetQuery) {
        this.props.updatePreviewSummary({
            ...datasetQuery,
            query: {
                ...datasetQuery.query,
                aggregation: ["count"]
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
        const { fields: { id, name, description, definition, revision_message }, segment, tableMetadata, handleSubmit, previewSummary } = this.props;

        return (
            <LoadingAndErrorWrapper loading={!tableMetadata}>
            { () =>
                <form className="full" onSubmit={handleSubmit}>
                    <div className="wrapper py4">
                        <FormLabel
                            title={(segment && segment.id != null ? "Edit" : "Create") + " Your Segment"}
                            description={segment && segment.id != null ?
                                "对段进行更改并留下解释说明。" :
                                "选择并添加筛选器，创建" + tableMetadata.display_name + " 表"
                            }
                        >
                            <PartialQueryBuilder
                                features={{
                                    filter: true
                                }}
                                tableMetadata={{
                                    ...tableMetadata,
                                    segments: null
                                }}
                                previewSummary={previewSummary == null ? "" : formatValue(previewSummary) + " rows"}
                                updatePreviewSummary={this.updatePreviewSummary.bind(this)}
                                {...definition}
                            />
                        </FormLabel>
                        <div style={{ maxWidth: "575px" }}>
                            <FormLabel
                                title="段名"
                                description="给你的段起个名字，帮助别人找到它。"
                            >
                                <FormInput
                                    field={name}
                                    placeholder="描述信息"
                                />
                            </FormLabel>
                            <FormLabel
                                title="描述信息"
                                description=" 给你的段一个描述，帮助别人理解它是什么。 "
                            >
                                <FormTextArea
                                    field={description}
                                    placeholder=" 对于不太明显的段规则，这是一个更好的解释方式。 "
                                />
                            </FormLabel>
                            { id.value != null &&
                                <FieldSet legend="Reason For Changes">
                                    <FormLabel description="说明你做了什么改变以及为什么要做这些事情。">
                                        <FormTextArea
                                            field={revision_message}
                                            placeholder=" 这将出现在这个部分的修订历史中，以帮助大家记住为什么会发生变化。 "
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
