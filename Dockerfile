FROM ubuntu:latest

ENV http_proxy=http://10.154.248.91:8080
ENV https_proxy=http://10.154.248.91:8080
ENV ftp_proxy=http://10.154.248.91:8080
ENV NO_PROXY="localhost,127.0.0.1,172.0.0.0/16,10.154.0.0/21,10.54.0.0/21"

ENV SIAB_PORT=4200 SIAB_USER=labuser SIAB_USERID=1000 SIAB_GROUP=shellinabox SIAB_GROUPID=1000 SIAB_PASSWORD=Lab@2021 SIAB_SHELL=/bin/bash SIAB_HOME=/home/labuser
    
RUN apt-get update
RUN apt-get install -y openssl curl openssh-client sudo shellinabox
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4200

ADD entrypoint.sh /usr/local/sbin/

RUN chmod a+x /usr/local/sbin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["shellinabox"]

