/* eslint "react/prop-types": "warn" */

import React from "react";
import PropTypes from "prop-types";
import QueryVisualizationObjectDetailTable from './QueryVisualizationObjectDetailTable.jsx';
import VisualizationErrorMessage from './VisualizationErrorMessage';
import Visualization from "metabase/visualizations/components/Visualization.jsx";
import { datasetContainsNoResults } from "metabase/lib/dataset";

const VisualizationResult = ({card, isObjectDetail, lastRunDatasetQuery, navigateToNewCardInsideQB, result, ...props}) => {
    const noResults = datasetContainsNoResults(result.data);

    if (isObjectDetail) {
        return <QueryVisualizationObjectDetailTable data={result.data} {...props} />
    } else if (noResults) {
        // successful query but there were 0 rows returned with the result
        return <VisualizationErrorMessage
                  type='noRows'
                  title='没有找到任何结果'
                  message='这也许是您要找的答案，如果没有，可能是筛选条件过于特殊，尝试删除或者更改过滤器以查看更多数据'
                  action={
                    <button className="Button" onClick={() => window.history.back() }>
                        查看最后一次查询
                    </button>
                  }
              />
    } else {
        // we want to provide the visualization with a card containing the latest
        // "display", "visualization_settings", etc, (to ensure the correct visualization is shown)
        // BUT the last executed "dataset_query" (to ensure data matches the query)
        let vizCard = {
            ...card,
            dataset_query: lastRunDatasetQuery
        };
        return <Visualization
                  series={[{ card: vizCard, data: result.data }]}
                  onChangeCardAndRun={navigateToNewCardInsideQB}
                  isEditing={true}
                  // Table:
                  {...props}
              />
    }
}

VisualizationResult.propTypes = {
    card:                     PropTypes.object.isRequired,
    isObjectDetail:           PropTypes.bool.isRequired,
    lastRunDatasetQuery:      PropTypes.object.isRequired,
    result:                   PropTypes.object.isRequired,
    navigateToNewCardInsideQB:  PropTypes.func,
}

export default VisualizationResult;
