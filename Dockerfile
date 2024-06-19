FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt clean && apt update && apt upgrade -y
RUN apt install -y software-properties-common
RUN apt install -y vim unzip cron supervisor 
RUN apt install -y nodejs npm
RUN add-apt-repository -y ppa:ondrej/php && apt-get update
RUN apt install -y nginx php7.4 php7.4-fpm php7.4-mysql php7.4-redis \
  php7.4-mbstring php7.4-zip php7.4-xml php7.4-curl php7.4-gd
RUN apt install -yq tzdata && \ 
  ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata
RUN mkdir -p /run/php/
