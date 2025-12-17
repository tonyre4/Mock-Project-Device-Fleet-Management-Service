#!/bin/bash

set -e

readonly THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${THIS_SCRIPT_DIR}/common.sh

build_docker_image(){
    ${DOCKER_EXE} build -t ${DOCKER_INSTANCE_NAME} ${DOCKER_FILE_LOCATION}   
}

start_docker_container(){
    ${DOCKER_EXE} run --name ${DOCKER_INSTANCE_NAME} ${DOCKER_INSTANCE_NAME}
}

main(){
    get_docker_exe
    build_docker_image
}

main $@