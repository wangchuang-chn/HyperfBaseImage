FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

RUN yum -y install gcc gcc-c++ \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum -y install php72 php72-php-pecl-swoole php72-php-mysqlnd  php72-php-pecl-redis \
    && curl -sS https://getcomposer.org/installer | /usr/bin/php72 -- --install-dir=/usr/local/bin --filename=composer \
    && && yum clean all \
