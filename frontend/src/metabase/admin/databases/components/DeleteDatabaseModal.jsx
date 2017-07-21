import React, { Component } from "react";
import PropTypes from "prop-types";

import ModalContent from "metabase/components/ModalContent.jsx";

import cx from "classnames";

export default class DeleteDatabaseModal extends Component {
    constructor(props, context) {
        super(props, context);
        this.state = {
            confirmValue: "",
            error: null
        };
    }

    static propTypes = {
        database: PropTypes.object.isRequired,
        onClose: PropTypes.func,
        onDelete: PropTypes.func
    };

    async deleteDatabase() {
        try {
            this.props.onDelete(this.props.database);
        } catch (error) {
            this.setState({ error });
        }
    }

    render() {
        const { database } = this.props;

        var formError;
        if (this.state.error) {
            var errorMessage = "Server error encountered";
            if (this.state.error.data &&
                this.state.error.data.message) {
                errorMessage = this.state.error.data.message;
            } else {
                errorMessage = this.state.error.message;
            }

            // TODO: timeout display?
            formError = (
                <span className="text-error px2">{errorMessage}</span>
            );
        }

        let confirmed = this.state.confirmValue.toUpperCase() === "DELETE";

        return (
            <ModalContent
                title="Delete Database"
                onClose={this.props.onClose}
            >
                <div className="Form-inputs mb4">
                    { database.is_sample &&
                        <p><strong>提示:</strong> 

如果没有示例数据集，查询生成引导器将不起作用。不过，您可以还原示例数据集。 </p>
                    }
                    <p>
                       

您确定要删除此数据库吗？所有依赖该数据库的保存的问题都将丢失。 
<strong>此操作不可撤销</strong>. 确定删除请按下方 <strong>删除</strong> :
                    </p>
                    <input className="Form-input" type="text" onChange={(e) => this.setState({ confirmValue: e.target.value })} autoFocus />
                </div>

                <div className="Form-actions">
                    <button className={cx("Button Button--danger", { "disabled": !confirmed })} onClick={() => this.deleteDatabase()}>Delete</button>
                    <button className="Button Button--primary ml1" onClick={this.props.onClose}>Cancel</button>
                    {formError}
                </div>
            </ModalContent>
        );
    }
}
