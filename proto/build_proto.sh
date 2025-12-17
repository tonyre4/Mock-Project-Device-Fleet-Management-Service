#!/bin/bash
set -e

readonly THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly DOCKER_INSTANCE_NAME="proto-builder"
readonly PROTO_FILES_TAR_LOCATION="/proto/ProtoFiles.tar"
readonly PROTO_FILES_DEST_DIR="${THIS_SCRIPT_DIR}/../"
export DOCKER_EXE=""
export TAR_EXE=""

get_exe_path(){
    local exe_name=$1
    which ${exe_name}
}

get_docker_exe(){
    export DOCKER_EXE=$(get_exe_path "docker")
}

get_tar_exe(){
    export TAR_EXE=$(get_exe_path "tar")
}

get_needed_exes(){
    get_docker_exe
    get_tar_exe
}

build_docker_image(){
    ${DOCKER_EXE} build -t ${DOCKER_INSTANCE_NAME} ${THIS_SCRIPT_DIR}   
}

start_docker_container(){
    ${DOCKER_EXE} run --name ${DOCKER_INSTANCE_NAME} ${DOCKER_INSTANCE_NAME}
}

copy_generated_proto_files(){
    ${DOCKER_EXE} cp ${DOCKER_INSTANCE_NAME}:${PROTO_FILES_TAR_LOCATION} /tmp/ProtoFiles.tar
    ${TAR_EXE} -xvf /tmp/ProtoFiles.tar -C ${PROTO_FILES_DEST_DIR}
    rm /tmp/ProtoFiles.tar
}

stop_docker_container(){
    ${DOCKER_EXE} stop ${DOCKER_INSTANCE_NAME}
}

delete_docker_image_and_container(){
    ${DOCKER_EXE} rm ${DOCKER_INSTANCE_NAME}
    ${DOCKER_EXE} rmi ${DOCKER_INSTANCE_NAME}
}

main(){
    get_needed_exes
    build_docker_image
    start_docker_container
    copy_generated_proto_files
    stop_docker_container
    delete_docker_image_and_container
}

main $@