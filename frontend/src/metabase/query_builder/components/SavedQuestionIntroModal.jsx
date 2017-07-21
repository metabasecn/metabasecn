import React, { Component } from "react";

import Modal from "metabase/components/Modal.jsx";


export default class SavedQuestionIntroModal extends Component {

    render() {
        return (
            <Modal small isOpen={this.props.isShowingNewbModal}>
                <div className="Modal-content Modal-content--small NewForm">
                    <div className="Modal-header Form-header">
                        <h2 className="pb2 text-dark">保存的问题可以重复查看以及更改</h2>

                        <div className="pb1 text-grey-4">除非单击右上方的编辑图标，否则不会对保存的问题进行任何永久更改。</div>
                    </div>

                    <div className="Form-actions flex justify-center py1">
                        <button data-metabase-event={"QueryBuilder;IntroModal"} className="Button Button--primary" onClick={() => this.props.onClose()}>确定</button>
                    </div>
                </div>
            </Modal>
        );
    }
}
