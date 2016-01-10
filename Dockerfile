FROM ubuntu:latest
MAINTAINER david <david@cninone.com>

RUN apt-get update && apt-get install -y software-properties-common python-software-properties openssh-server supervisor \
    git build-essential vim emacs \
    libreadline-dev libncurses5-dev libssl-dev
RUN mkdir /var/run/sshd
RUN echo 'root:freego' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN git clone https://github.com/SoftEtherVPN/SoftEtherVPN.git /usr/local/src/vpnserver \
    && cd /usr/local/src/vpnserver \
    && cp src/makefiles/linux_64bit.mak Makefile \
    && make \
    && cp bin/vpnserver/vpnserver /usr/local/bin/vpnserver \
    && cp bin/vpnserver/hamcore.se2 /usr/local/bin/hamcore.se2 \
    && cp bin/vpncmd/vpncmd /usr/local/bin/vpncmd \
    && rm -rf /usr/local/src/vpnserver
    
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22

CMD ["/usr/bin/supervisord"]