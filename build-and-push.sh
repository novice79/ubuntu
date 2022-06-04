#!/usr/bin/env bash

log () {
    printf "[%(%Y-%m-%d %T)T] %s\n" -1 "$*"
}
git add .
git commit -am"build new version"
git push origin master

docker pull ubuntu:latest
docker build -t novice/ubuntu .
docker push novice/ubuntu 