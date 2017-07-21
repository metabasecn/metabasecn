import React, { Component } from "react";
import ReactDOM from "react-dom";

import ActionButton from "metabase/components/ActionButton.jsx";
import ModalContent from "metabase/components/ModalContent.jsx";

import { capitalize } from "metabase/lib/formatting";
import cx from "classnames";

export default class ObjectRetireModal extends Component {
    constructor(props, context) {
        super(props, context);
        this.state = {
            valid: false
        };
    }

    async handleSubmit() {
        const { object, objectType } = this.props;
        let payload = {
            revision_message: ReactDOM.findDOMNode(this.refs.revision_message).value
        };
        payload[objectType+"Id"] = object.id;

        await this.props.onRetire(payload);
        this.props.onClose();
    }

    render() {
        const { objectType } = this.props;
        const { valid } = this.state;
        return (
            <ModalContent
                title={"Retire This " + capitalize(objectType)}
                onClose={this.props.onClose}
            >
                <form className="flex flex-column flex-full">
                    <div className="Form-inputs pb4">
                        <p>保存 {objectType}后,  {objectType} 可以不再从查询生成器中生成.</p>
                        <p>如果确定删除 {objectType}, 请写下删除的原因:</p>
                        <textarea
                            ref="revision_message"
                            className="input full"
                            placeholder={"这将出现在活动feed和电子邮件中，该邮件将发送给您的团队中的任何人，他们使用这个创建了一些东西。 " + objectType + "."}
                            onChange={(e) => this.setState({ valid: !!e.target.value })}
                        />
                    </div>

                    <div className="Form-actions">
                        <ActionButton
                            actionFn={this.handleSubmit.bind(this)}
                            className={cx("Button", { "Button--primary": valid, "disabled": !valid })}
                            normalText="Retire"
                            activeText="Retiring…"
                            failedText="Failed"
                            successText="Success"
                        />
                        <a className="Button Button--borderless" onClick={this.props.onClose}>
                            取消
                        </a>
                    </div>
                </form>
            </ModalContent>
        );
    }
}
