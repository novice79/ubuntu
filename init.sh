#!/usr/bin/env bash

log () {
    printf "[%(%Y-%m-%d %T)T] %s\n" -1 "$*"
}

sudo chown -R novice:novice $HOME/.ssh/

sudo /usr/sbin/sshd -D