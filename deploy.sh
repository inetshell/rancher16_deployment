#!/usr/bin/env bash
export SCRIPT_HOME="$( cd "$(dirname "${0}")" ; pwd -P )"

mkdir -p ${SCRIPT_HOME}/volumes/rancher-mysql
mkdir -p ${SCRIPT_HOME}/volumes/rancher-mysql-log
mkdir -p ${SCRIPT_HOME}/volumes/rancher-cattle
mkdir -p ${SCRIPT_HOME}/volumes/frontend-log

if [ -z "${CERTBOT_EMAIL}" ] || [ -z ${RANCHER_DNS} ]; then
    echo "CERTBOT_EMAIL or RANCHER_DNS variables are not defined"
    exit 1
fi

docker-compose up --build -d --project-name 'rancher' -f docker/docker-compose.yml