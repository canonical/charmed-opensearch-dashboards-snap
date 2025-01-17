#!/usr/bin/env bash

set -eu

source "${OPS_ROOT}"/helpers/get-conf.sh

function fetch_exporter_args () {
    DASHBOARDS_HOST=$( get_yaml_prop "${OPENSEARCH_DASHBOARDS_PATH_CONF}/opensearch_dashboards.yml" "server.host" "localhost" )
    DASHBOARDS_PORT=$( get_yaml_prop "${OPENSEARCH_DASHBOARDS_PATH_CONF}/opensearch_dashboards.yml" "server.port" "5601" )
    export DASHBOARDS_USERNAME=$( get_yaml_prop "${OPENSEARCH_DASHBOARDS_PATH_CONF}/opensearch_dashboards.yml" "opensearch.username" "kibanaserver" )
    export OPENSEARCH_DASHBOARDS_PASSWORD=$( get_yaml_prop "${OPENSEARCH_DASHBOARDS_PATH_CONF}/opensearch_dashboards.yml" "opensearch.password" "kibanaserver" )
    SCHEME=$(snapctl get scheme)
}

function start_exporter () {
    exec "${SNAP}"/usr/bin/setpriv \
        --clear-groups \
        --reuid snap_daemon \
        --regid snap_daemon -- \
        ${OPENSEARCH_DASHBOARDS_DEPS_BIN}/prometheus-opensearch-dashboards-exporter \
        --url ${SCHEME}://${DASHBOARDS_HOST}:${DASHBOARDS_PORT}
}


fetch_exporter_args
start_exporter
