import React from "react";
import PropTypes from "prop-types";
import pure from "recompose/pure";

import EditButton from "metabase/reference/components/EditButton.jsx";

const GuideHeader = ({
    startEditing,
    isSuperuser
}) =>
    <div>
        <div className="wrapper wrapper--trim py4 my3">
            <div className="flex align-center">
                <h1 className="text-dark" style={{fontWeight: 700}}>从这里开始(添加数据源).</h1>
                { isSuperuser &&
                    <span className="ml-auto">
                        <EditButton startEditing={startEditing}/>
                    </span>
                }
            </div>
            <p className="text-paragraph" style={{maxWidth: 620}}>
                这是一个完美的开始，如果您需要探索一些数据.</p>
        </div>
    </div>;

GuideHeader.propTypes = {
    startEditing: PropTypes.func.isRequired,
    isSuperuser: PropTypes.bool
};

export default pure(GuideHeader);
