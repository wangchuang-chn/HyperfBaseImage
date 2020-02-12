FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

EXPOSE 80

RUN yum -y install gcc gcc-c++ git  php-pear \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum -y install php72  php72-php-mysqlnd  \
    && ln -s /usr/bin/php72 /usr/bin/php \
    && pecl install swoole \
    && pecl install redis \
    && curl -sS https://getcomposer.org/installer | /usr/bin/php72 -- --install-dir=/usr/local/bin --filename=composer \
    && yum clean all \