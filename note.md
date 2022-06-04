
for using docker with kvm and shared same bridge device, 
you can set container static ip and default gateway by

```
docker run -d \
--privileged \
--restart=always \
--name ub20 \
-e ip=192.168.2.1 \
-e mask=255.255.0.0 \
-e gw=192.168.0.1 \
-h ub20 \
-v ssh:/home/novice/.ssh \
-v /data:/data \
novice/ubuntu:20.04
```