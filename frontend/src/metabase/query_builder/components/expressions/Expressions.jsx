import React, { Component } from "react";
import PropTypes from "prop-types";
import _ from "underscore";

import Icon from "metabase/components/Icon.jsx";
import IconBorder from "metabase/components/IconBorder.jsx";
import Tooltip from "metabase/components/Tooltip.jsx";

import { format } from "metabase/lib/expressions/formatter";


export default class Expressions extends Component {

    static propTypes = {
        expressions: PropTypes.object,
        tableMetadata: PropTypes.object,
        onAddExpression: PropTypes.func.isRequired,
        onEditExpression: PropTypes.func.isRequired
    };

    static defaultProps = {
        expressions: {}
    };

    render() {
        const { expressions, onAddExpression, onEditExpression } = this.props;

        let sortedNames = _.sortBy(_.keys(expressions), _.identity);
        return (
            <div className="pb3">
                <div className="pb1 h6 text-uppercase text-grey-3 text-bold">自定义字段</div>

                { sortedNames && sortedNames.map(name =>
                    <div key={name} className="pb1 text-brand text-bold cursor-pointer flex flex-row align-center justify-between" onClick={() => onEditExpression(name)}>
                        <span>{name}</span>
                        <Tooltip tooltip={format(expressions[name], {
                            tableMetadata: this.props.tableMetadata,
                            customFields: expressions
                        })}>
                            <span className="QuestionTooltipTarget" />
                        </Tooltip>
                    </div>
                  )}

                    <a data-metabase-event={"QueryBuilder;Show Add Custom Field"} className="text-grey-2 text-bold flex align-center text-grey-4-hover cursor-pointer no-decoration transition-color" onClick={() => onAddExpression()}>
                        <IconBorder borderRadius="3px">
                            <Icon name="add" size={14} />
                        </IconBorder>
                        <span className="ml1">添加自定义字段</span>
                    </a>
            </div>
        );
    }
}