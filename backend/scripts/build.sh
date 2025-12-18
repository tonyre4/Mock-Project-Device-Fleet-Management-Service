#!/bin/bash

set -ex

source $(dirname "$0")/common.sh

build(){
    remove_docker_container
    remove_docker_image

    build_docker_image
}

main(){
    get_docker_exe
    build
}

main $@