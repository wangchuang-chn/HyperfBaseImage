FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

EXPOSE 80

RUN yum -y install gcc gcc-c++ git yum-utils make \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php72 \
    && yum -y install php  php-mysqlnd php-devel php-pear php-pecl-redis5 php-pdo\
    && get https://github.com/swoole/swoole-src/archive/v4.4.5.tar.gz -O swoole  \
    && tar zxvf swoole \
    && cd swoole-src-4.4.5 \
    && phpize && ./configure --enable-openssl --enable-http2  --enable-sockets --enable-mysqlnd  && make && make install \
    && curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/local/bin --filename=composer \
    && yum clean all \