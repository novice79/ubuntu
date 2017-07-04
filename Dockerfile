FROM ubuntu:latest
MAINTAINER david <david@cninone.com>

RUN apt-get update && apt-get install -y software-properties-common python-software-properties \
    openssh-server supervisor nginx \
    git build-essential vim curl sudo cron net-tools
ENV TZ=Asia/Chongqing
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN cd ~ \
    && wget https://raw.githubusercontent.com/novice79/sevpn/master/softether-vpnclient-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz \
    && tar zxvf softether*.tar.gz \
    && cd vpnclient && make i_read_and_agree_the_license_agreement && cd .. \
    && mv vpnclient /


RUN mkdir /var/run/sshd
RUN useradd -ms /bin/bash david && usermod -aG sudo david
RUN echo 'david:freego' | chpasswd
RUN echo 'root:freego_2017' | chpasswd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*    
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]