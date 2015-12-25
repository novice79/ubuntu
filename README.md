# ubuntu
ubuntu14.04 with sshd

# run it like this
docker run -p 222:22  --name fg -t novice/ubuntu
ssh root user pass: *freego*

# and test it:
$ssh root@$(docker-machine ip default) -p 222
root@192.168.99.100's password:freego
root@1d0f67e86996:~# 