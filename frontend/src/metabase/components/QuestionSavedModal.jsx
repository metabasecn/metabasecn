import React, { Component } from "react";
import PropTypes from "prop-types";

import ModalContent from "metabase/components/ModalContent.jsx";


export default class QuestionSavedModal extends Component {
    static propTypes = {
        addToDashboardFn: PropTypes.func.isRequired,
        onClose: PropTypes.func.isRequired
    };

    render() {
        return (
            <ModalContent
                id="QuestionSavedModal"
                title="已保存!添加到仪表板吗?"
                onClose={this.props.onClose}
                className="Modal-content Modal-content--small NewForm"
            >
                <div className="Form-inputs mb4">
                    <button className="Button Button--primary" onClick={this.props.addToDashboardFn}>好的</button>
                    <button className="Button ml3" onClick={this.props.onClose}>不是现在</button>
                </div>
            </ModalContent>
        );
    }
}
