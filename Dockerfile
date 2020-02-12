FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

EXPOSE 80

RUN yum -y install gcc gcc-c++ git \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum -y install php  php-mysqlnd php-devel php-pear\
    && pecl install swoole \
    && pecl install redis \
    && curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/local/bin --filename=composer \
    && yum clean all \