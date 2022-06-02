# ubuntu dev env
ubuntu with ssh server and some utils as a dev env virtual machine

docker build -t novice/ubuntu .

docker run -d --name ub22 -p 2222:22 -h ub22 ubdev