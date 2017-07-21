import React, { Component } from "react"
import { connect } from "react-redux"

import Button from "metabase/components/Button"
import Icon from "metabase/components/Icon"
import ModalWithTrigger from "metabase/components/ModalWithTrigger"
import Tooltip from "metabase/components/Tooltip"

import { archiveQuestion } from "metabase/query_builder/actions"

const mapStateToProps = () => ({})

const mapDispatchToProps = {
    archiveQuestion
}

@connect(mapStateToProps, mapDispatchToProps)
class ArchiveQuestionModal extends Component {
    onArchive = async () => {
        try {
            await this.props.archiveQuestion()
            this.onClose();
        } catch (error) {
            console.error(error)
            this.setState({ error })
        }
    }

    onClose = () => {
        if (this.refs.archiveModal) {
            this.refs.archiveModal.close();
        }
    }

    render () {
        return (
            <ModalWithTrigger
                ref="archiveModal"
                triggerElement={
                    <Tooltip key="archive" tooltip="Archive">
                        <span className="text-brand-hover">
                            <Icon name="archive" size={16} />
                        </span>
                    </Tooltip>
                }
                title="将这个问题归档?"
                footer={[
                    <Button key='cancel' onClick={this.onClose}>取消</Button>,
                    <Button key='archive' warning onClick={this.onArchive}>归档</Button>
                ]}
            >
                <div className="px4 pb4">这个问题将从所有仪表板里删除并且暂停使用.</div>
            </ModalWithTrigger>
        )
    }
}

export default ArchiveQuestionModal