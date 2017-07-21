import React, { Component } from "react";
import { connect } from "react-redux";

import ModalWithTrigger from "metabase/components/ModalWithTrigger";
import Button from "metabase/components/Button";
import Icon from "metabase/components/Icon";
import Tooltip from "metabase/components/Tooltip";

import { setCollectionArchived } from "../collections";

const mapStateToProps = (state, props) => ({
})

const mapDispatchToProps = {
    setCollectionArchived
}

@connect(mapStateToProps, mapDispatchToProps)
export default class ArchiveCollectionWidget extends Component {
    _onArchive = async () => {
        try {
            await this.props.setCollectionArchived(this.props.collectionId, true);
            this._onClose();
            if (this.props.onArchived) {
                this.props.onArchived();
            }
        } catch (error) {
            console.error(error)
            this.setState({ error })
        }
    }

    _onClose = () => {
        if (this.refs.modal) {
            this.refs.modal.close();
        }
    }

    render() {
        return (
            <ModalWithTrigger
                {...this.props}
                ref="modal"
                triggerElement={
                    <Tooltip tooltip="归档集合">
                        <Icon size={18} name="archive" />
                    </Tooltip>
                }
                title="确定归档集合吗?"
                footer={[
                    <Button onClick={this._onClose}>取消</Button>,
                    <Button warning onClick={this._onArchive}>确定归档</Button>
                ]}
            >
                <div className="px4 pb4">集合中的问题也会归档.</div>
            </ModalWithTrigger>
        );
    }
}
