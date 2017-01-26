#!/bin/sh

# create a vim docker image with the current user

command -v docker2 2>&1 > /dev/null || { echo "no docker command found ! cannot create my image ! please install Docker
first"; exit 1; }

userName=$(whoami)
userGroup=$(id -gn $userName)
userGroupId=$(id -g $userName)

docker build -f Dockerfile.alpine-vim -t alpine-vim --pull . \
    --build-arg userName=$userName \
    --build-arg userId=$UID \
    --build-arg userGroupId=$userGroupId \
    --build-arg userGroup=$userGroup

