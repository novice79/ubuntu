# ubuntu dev env
ubuntu with ssh server and some utils as a dev env virtual machine

docker build -t novice/ubuntu:20.04 .
<!-- yes | docker image prune -->
docker run -d --name ub20 -p 2222:22 -h ub20 novice/ubuntu:20.04