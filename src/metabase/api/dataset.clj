(ns metabase.api.dataset
  "/api/dataset endpoints."
  (:require [cheshire.core :as json]
            [clojure.data.csv :as csv]
            [clojure.string :as str]
            [compojure.core :refer [POST]]
            [dk.ative.docjure.spreadsheet :as spreadsheet]
            [metabase
             [middleware :as middleware]
             [query-processor :as qp]
             [util :as u]]
            [metabase.api.common :as api]
            [metabase.api.common.internal :refer [route-fn-name]]
            [metabase.models
             [database :refer [Database]]
             [query :as query]]
            [metabase.query-processor.util :as qputil]
            [metabase.util.schema :as su]
            [schema.core :as s])
  (:import [java.io ByteArrayInputStream ByteArrayOutputStream]))

;;; ------------------------------------------------------------ Constants ------------------------------------------------------------

(def ^:private ^:const max-results-bare-rows
  "Maximum number of rows to return specifically on :rows type queries via the API."
  2000)

(def ^:private ^:const max-results
  "General maximum number of rows to return from an API query."
  10000)

(def ^:const default-query-constraints
  "Default map of constraints that we apply on dataset queries executed by the api."
  {:max-results           max-results
   :max-results-bare-rows max-results-bare-rows})


(defn index-of [item coll]
  (count (take-while (partial not= item) coll)))


;;; ------------------------------------------------------------ Running a Query Normally ------------------------------------------------------------

(api/defendpoint POST "/"
  "Execute a query and retrieve the results in the usual format."
                 ;;(def query {:database 3, :type "query", :query {:source_table 236, :filter ["AND" ["=" ["field-id" 1780] 99338240]]}, :parameters []})
  [:as {{:keys [database], :as query} :body}]
   ;if (= ((query :query) :filter) nil)
                 ;;判断是不是管理员，是管理员就跳过，不是管理员就设置字段筛选条件
             ;;如果没有筛选条件，增加筛选条件,更改变量需要重新定义
                 ;;  (def ff {:database (f :database) :type (f :type) :query {:source_table ((f :query) :source_table) :filter  (conj ((f :query) :filter) ["=" ["field-id" 1780] 99338240] )} :parameters (f :parameters)})                                          ;;
  {database s/Int}
  (api/read-check Database database)
                 (def fid_key (index-of (str "source_table_" ((query :query) :source_table)  ) (list "source_table_3")))
                 (def fid (get [1780] (-  fid_key 1) ))
                 (def q2 query)
                 (def uid api/*current-user-id*)
                 (if (= api/*is-superuser?*  false)
                   (
                     println "不是管理员，增加UID筛选条件"
                    (if (= ((q2 :query) :filter) nil)
                      (
                        println "没有筛选条件"                    ;;需要增加AND
                                (def q3 {:database (q2 :database) :type (q2 :type) :query {:source_table ((q2 :query) :source_table) :filter   [ "AND" ["=" ["field-id" fid] uid]] } :parameters (q2 :parameters)}
                                  )
                                )
                      (
                      println "有筛选条件"                  ;;不需要增加AND
                              (def q3 {:database (q2 :database) :type (q2 :type) :query {:source_table ((q2 :query) :source_table) :filter  (conj ((q2 :query) :filter) ["=" ["field-id" fid] uid] )} :parameters (q2 :parameters)}
                                )
                              ))
                             )
                   (
 (def q3 query)
                    println "是管理员，跳过"
                     )

                   )
  ;; add sensible constraints for results limits on our query
  (let [query (assoc q3 :constraints default-query-constraints)]
    (qp/process-query-and-save-execution! query {:executed-by api/*current-user-id*, :context :ad-hoc})))


;;; ------------------------------------------------------------ Downloading Query Results in Other Formats ------------------------------------------------------------

(defn- export-to-csv [columns rows]
  (with-out-str
    ;; turn keywords into strings, otherwise we get colons in our output
    (csv/write-csv *out* (into [(mapv name columns)] rows))))

(defn- export-to-xlsx [columns rows]
  (let [wb  (spreadsheet/create-workbook "Query result" (conj rows (mapv name columns)))
        ;; note: byte array streams don't need to be closed
        out (ByteArrayOutputStream.)]
    (spreadsheet/save-workbook! out wb)
    (ByteArrayInputStream. (.toByteArray out))))

(defn- export-to-json [columns rows]
  (for [row rows]
    (zipmap columns row)))

(def ^:private export-formats
  {"csv"  {:export-fn    export-to-csv
           :content-type "text/csv"
           :ext          "csv"
           :context      :csv-download},
   "xlsx" {:export-fn    export-to-xlsx
           :content-type "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
           :ext          "xlsx"
           :context      :xlsx-download},
   "json" {:export-fn    export-to-json
           :content-type "applicaton/json"
           :ext          "json"
           :context      :json-download}})

(def ExportFormat
  "Schema for valid export formats for downloading query results."
  (apply s/enum (keys export-formats)))

(defn export-format->context
  "Return the `:context` that should be used when saving a QueryExecution triggered by a request to download results in EXPORT-FORAMT.

     (export-format->context :json) ;-> :json-download"
  [export-format]
  (or (get-in export-formats [export-format :context])
      (throw (Exception. (str "Invalid export format: " export-format)))))

(defn as-format
  "Return a response containing the RESULTS of a query in the specified format."
  {:style/indent 1, :arglists '([export-format results])}
  [export-format {{:keys [columns rows]} :data, :keys [status], :as response}]
  (api/let-404 [export-conf (export-formats export-format)]
    (if (= status :completed)
      ;; successful query, send file
      {:status  200
       :body    ((:export-fn export-conf) columns rows)
       :headers {"Content-Type"        (str (:content-type export-conf) "; charset=utf-8")
                 "Content-Disposition" (str "attachment; filename=\"query_result_" (u/date->iso-8601) "." (:ext export-conf) "\"")}}
      ;; failed query, send error message
      {:status 500
       :body   (:error response)})))

(def export-format-regex
  "Regex for matching valid export formats (e.g., `json`) for queries.
   Inteneded for use in an endpoint definition:

     (api/defendpoint POST [\"/:export-format\", :export-format export-format-regex]"
  (re-pattern (str "(" (str/join "|" (keys export-formats)) ")")))

(api/defendpoint POST ["/:export-format", :export-format export-format-regex]
  "Execute a query and download the result data as a file in the specified format."
  [export-format query]
  {query         su/JSONString
   export-format ExportFormat}
  (let [query (json/parse-string query keyword)]
    (api/read-check Database (:database query))
    (as-format export-format
      (qp/process-query-and-save-execution! (dissoc query :constraints)
        {:executed-by api/*current-user-id*, :context (export-format->context export-format)}))))


;;; ------------------------------------------------------------ Other Endpoints ------------------------------------------------------------

;; TODO - this is no longer used. Should we remove it?
(api/defendpoint POST "/duration"
  "Get historical query execution duration."
  [:as {{:keys [database], :as query} :body}]
  (api/read-check Database database)
  ;; try calculating the average for the query as it was given to us, otherwise with the default constraints if there's no data there.
  ;; if we still can't find relevant info, just default to 0
  {:average (or (query/average-execution-time-ms (qputil/query-hash query))
                (query/average-execution-time-ms (qputil/query-hash (assoc query :constraints default-query-constraints)))
                0)})

(api/define-routes
  (middleware/streaming-json-response (route-fn-name 'POST "/")))
