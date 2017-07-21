import React, { Component } from "react";

import Button from "metabase/components/Button";
import ColorPicker from "metabase/components/ColorPicker";
import FormField from "metabase/components/FormField";
import Input from "metabase/components/Input";
import Modal from "metabase/components/Modal";

import { reduxForm } from "redux-form";

import { normal, getRandomColor } from "metabase/lib/colors";

const formConfig = {
    form: 'collection',
    fields: ['id', 'name', 'description', 'color'],
    validate: (values) => {
        const errors = {};
        if (!values.name) {
            errors.name = "请输入名称";
        } else if (values.name.length > 100) {
            errors.name = "名称必须小于100个字符";
        }
        if (!values.color) {
            errors.color = "请选择颜色";
        }
        return errors;
    },
    initialValues: {
        name: "",
        description: "",
        // pick a random color to start so everything isn't blue all the time
        color: getRandomColor(normal)
    }
}

export const getFormTitle = ({ id, name }) =>
    id.value ? name.value : "新的集合"

export const getActionText = ({ id }) =>
    id.value ? "更新": "新建"


export const CollectionEditorFormActions = ({ handleSubmit, invalid, onClose, fields}) =>
    <div>
        <Button className="mr1" onClick={onClose}>
            Cancel
        </Button>
        <Button primary disabled={invalid} onClick={handleSubmit}>
            { getActionText(fields) }
        </Button>
    </div>

export class CollectionEditorForm extends Component {
    props: {
        fields: Object,
        onClose: Function,
        invalid: Boolean,
        handleSubmit: Function,
    }

    render() {
        const { fields, onClose } = this.props;
        return (
            <Modal
                inline
                form
                title={getFormTitle(fields)}
                footer={<CollectionEditorFormActions {...this.props} />}
                onClose={onClose}
            >
                <div className="NewForm ml-auto mr-auto mt4 pt2" style={{ width: 540 }}>
                    <FormField
                        displayName="集合名"
                        {...fields.name}
                    >
                        <Input
                            className="Form-input full"
                            placeholder="请输入集合名"
                            autoFocus
                            {...fields.name}
                        />
                    </FormField>
                    <FormField
                        displayName="集合描述"
                        {...fields.description}
                    >
                        <textarea
                            className="Form-input full"
                            placeholder="集合描述，可不填"
                            {...fields.description}
                        />
                    </FormField>
                    <FormField
                        displayName="设置集合颜色"
                        {...fields.color}
                    >
                        <ColorPicker {...fields.color} />
                    </FormField>
                </div>
            </Modal>
        )
    }
}

export default reduxForm(formConfig)(CollectionEditorForm)
