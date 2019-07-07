#!/bin/bash

USAGE=". github clone [-t {github|self|work|...}] {url} [path]"

GITHUBROOT="$HOME/src/" #todo: .config
TYPE="github" #todo: auto type
POSITIONAL=()
DEBUG="NO"
while [[ $# -gt 0 ]]
do
key="$1"

function terminate_script {
    [[ "${BASH_SOURCE[0]}" == "${0}" ]] && exit 0 || return 0;
}

case $key in
    -t|--type)
    TYPE="$2"
    shift # past argument
    shift # past value
    ;;
    --debug)
    DEBUG="YES"
    shift # past argument
    ;;
    -h|--help)
    echo "$USAGE"
    terminate_script
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

SOURCE="$2"
PROJECT_NAME=$(basename -s .git "$SOURCE")
TARGET_NAME="${3:-$PROJECT_NAME}"
TARGET_PATH="$GITHUBROOT$TYPE/$TARGET_NAME"

if [ $DEBUG == "YES" ]; then
    echo "SOURCE  = ${SOURCE}"
    echo "TARGET  = ${TARGET_PATH}"
    terminate_script
fi

if [ -d "$TARGET_PATH" ]; then
    cd $TARGET_PATH
    git fetch
else
    git clone $SOURCE $TARGET_PATH
    cd $TARGET_PATH
fi
