# ubuntu
ubuntu14.04 with sshd softetherVPN

# start your vpn server like this
docker run -p 222:22 -p 500:500/udp -p 4500:4500/udp -p 1701:1701/tcp -p 443:443/tcp -p 992:992/tcp 5555:5555/tcp --name fg -t novice/ubuntu
ssh root user pass: *freego*

# and test it:
$ssh root@$(docker-machine ip default) -p 222
root@192.168.99.100's password:**freego**
root@1d0f67e86996:~# 