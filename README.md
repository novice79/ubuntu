# ubuntu dev env
ubuntu with ssh server and some utils as a dev env virtual machine

docker build -t novice/ubuntu .
<!-- 
git push --all origin
docker push -a novice/ubuntu 
-->

# usage: run this command (and then ssh login to it)
docker run -d --name ub22 -p 2222:22 -h ub22 novice/ubuntu