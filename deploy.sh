#!/usr/bin/env bash
export SCRIPT_HOME="$( cd "$(dirname "${0}")" ; pwd -P )"
export VARS_FILE="${SCRIPT_HOME}/vars/load_vars.sh"

if [[ -f "${VARS_FILE}" ]]; then
    echo "Loading variables file ${VARS_FILE}"
    source "${VARS_FILE}"
fi

if [[ -z "${CERTBOT_EMAIL}" ]] || [[ -z ${RANCHER_DNS} ]] || [[ -z ${RANCHER_VERSION} ]]; then
    echo "CERTBOT_EMAIL, RANCHER_DNS, RANCHER_VERSION variables are not defined"
    exit 1
fi

docker-compose pull
docker-compose --project-name 'rancher' up --build -d
