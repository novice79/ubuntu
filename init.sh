#!/usr/bin/env bash

log () {
    printf "[%(%Y-%m-%d %T)T] %s\n" -1 "$*"
}

sudo chown -R novice:novice $HOME/.ssh/

# set ip gw show run in --privileged mode, 
# if not but supply the vars, it will naturally failed 
if [[ -n "$ip" && -n "$mask" ]]; then
    sudo ifconfig eth0 "$ip" netmask "$mask"
fi

if [[ -n "$gw" ]]; then
    sudo route add default gw "$gw"
fi

sudo /usr/sbin/sshd -D