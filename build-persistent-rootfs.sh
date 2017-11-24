#!/usr/bin/env bash

set -ef

DIRS_TO_COPY="emqttd mosquitto nodered"
BASE_PATH="srv/lib"

TARGET_DIR=${1:-${HOME}/Build/${BASE_PATH}}
[ -d ${TARGET_DIR} ] || mkdir -p ${TARGET_DIR}

echo "Setting up containers persistent rootfs ["${TARGET_DIR}"]."

for dir in ${DIRS_TO_COPY}; do
    echo -e "\tCopying" $dir
    cp -R $dir ${TARGET_DIR}/
done
echo "Done."

echo
echo "Please, remember to run:"
echo
echo -e "\texport COMPOSE_ROOTFS=${TARGET_DIR}"
echo
echo "before running local docker-compose."
echo
