#!/usr/bin/env bash

log () {
    printf "[%(%Y-%m-%d %T)T] %s\n" -1 "$*"
}
git add .
git commit -am"${1="build new version"}"
git push origin 20.04

docker pull ubuntu:20.04
docker build -t novice/ubuntu:20.04 .
docker push novice/ubuntu:20.04