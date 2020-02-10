FROM centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

RUN yum -y install gcc gcc-c++ \
    && yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum list|grep php
