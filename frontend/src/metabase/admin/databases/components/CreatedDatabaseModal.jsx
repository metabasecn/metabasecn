import React, { Component } from "react";
import PropTypes from "prop-types";
import { Link } from "react-router";

import ModalContent from "metabase/components/ModalContent.jsx";

import * as Urls from "metabase/lib/urls";

export default class CreatedDatabaseModal extends Component {
    static propTypes = {
        databaseId: PropTypes.number.isRequired,
        onClose: PropTypes.func.isRequired,
        onDone: PropTypes.func.isRequired
    };

    render() {
        const { onClose, onDone, databaseId } = this.props;
        return (
            <ModalContent
                title="数据库已经添加!"
                onClose={onClose}
            >
                <div className="Form-inputs mb4">
                    <p>
                        正在分析数据库<Link to={"/admin/datamodel/database/"+databaseId}>查看当前数据库</Link> 编辑当前数据库或者<Link to={Urls.question(null, `?db=${databaseId}`)}>新增分析</Link>查看数据库信息
                    </p>
                </div>

                <div className="Form-actions flex layout-centered">
                    <button className="Button Button--primary px3" onClick={onDone}>Done</button>
                </div>
            </ModalContent>
        );
    }
}
