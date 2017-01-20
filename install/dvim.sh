#!/bin/sh

# create a vim docker image with the current user

userName=$(whoami)
userGroup=$(id -gn $userName)
userGroupId=$(id -g $userName)

docker build -f Dockerfile.alpine-vim -t alpine-vim --pull . \
    --build-arg userName=$userName \
    --build-arg userId=$UID \
    --build-arg userGroupId=$userGroupId \
    --build-arg userGroup=$userGroup

