# ubuntu dev env
ubuntu with ssh server and some utils as a dev env virtual machine

docker build -t novice/ubuntu:20.04 .
<!-- yes | docker image prune -->
docker run -d \
--restart=always \
--name ub20 \
-p 2222:22 \
-h ub20 \
-v ssh:/home/novice/.ssh \
-v /data:/data \
novice/ubuntu:20.04