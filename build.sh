#!/bin/bash

set -e

VERSION="$1"

REMOTE_REPO="https://github.com/Code-Hex/Neo-cowsay"
LOCAL_REPO=${PWD}/repo
BUILD_DIR=${PWD}/build

if [ ! -d "${LOCAL_REPO}" ]; then
    git clone "${REMOTE_REPO}" "${LOCAL_REPO}"
fi

if [ ! -d "${BUILD_DIR}" ]; then
    mkdir -p "${BUILD_DIR}"
fi

function checkout() {
    cd ${LOCAL_REPO}
    git pull
    git checkout $1
}

function build() {
    cd ${LOCAL_REPO}
    OUT_DIR="${BUILD_DIR}/$1"
    if [ ! -d "${OUT_DIR}" ]; then
        mkdir -p ${OUT_DIR}
    fi
    go build -ldflags '-extldflags "-static" -w -s' \
        -o "${OUT_DIR}/cowsay" \
        ${LOCAL_REPO}/cmd/cowsay
    echo "Successfully built: ${OUT_DIR}/cowsay"
}

checkout ${VERSION}

GOOS=linux GOARCH=amd64 build amd64
GOOS=linux GOARCH=arm64 build arm64
GOOS=linux GOARCH=arm GOARM=7 build armv7

