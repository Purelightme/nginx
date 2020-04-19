FROM centos
MAINTAINER Purelightme

RUN yum install -y wget pcre pcre-devel zlib zlib-devel openssl openssl-devel boost boost-devel \
    gcc gcc-c++ automake autoconf libtool make

COPY nginx-1.16.1.tar.gz /opt/nginx-1.16.1.tar.gz

RUN mkdir /opt/nginx \
 && tar -zxvf /opt/nginx-1.16.1.tar.gz -C /opt/nginx

RUN cd /opt/nginx/nginx-1.16.1 && ./configure --prefix=/opt/nginx --build=Purelightme \
 && make \
 && make install

CMD touch /tmp/1.log && /opt/nginx/sbin/nginx && tail -f /tmp/1.log

EXPOSE 80
