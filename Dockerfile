FROM ubuntu:20.04

LABEL maintainer="Novice <novice@piaoyun.shop>"
ENV DEBIAN_FRONTEND noninteractive
ENV LANG       en_US.UTF-8
ENV LC_ALL	   "C.UTF-8"
ENV LANGUAGE   en_US:en

# COPY sources.list/al20.04.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y \
    software-properties-common \
    vim curl sudo cron screen \
    net-tools iputils-ping tzdata \
    openssh-server
# set TZ after tzdate installed
ENV TZ=Asia/Chongqing
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN mkdir /var/run/sshd
RUN useradd -ms /bin/bash novice && usermod -aG sudo novice
RUN echo 'novice:freego' | chpasswd 
RUN echo 'root:freego_2022' | chpasswd 
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "novice ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 
# grab old file : git show 510e282a23:Dockerfile  > aaa

USER 1000
WORKDIR /data
# ENTRYPOINT ["sudo", "/usr/sbin/sshd", "-D"]
COPY init.sh /
ENTRYPOINT ["/init.sh"]

# for test use:
# docker run -it --rm --name ub20 -p 2222:22 -h ub20 --entrypoint bash novice/ubuntu:20.04