FROM centos:centos7

MAINTAINER wangchuang<mail.wangchuang@gmail.com>

EXPOSE 80

RUN yum -y install  git yum-utils make wget \
    && yum -y install centos-release-scl \
    && yum  -y install devtoolset-7 \
    && echo  "export PATH=/opt/rh/devtoolset-7/root/usr/bin/:$PATH" >> /etc/profile \
    && source /etc/profile \
    && gcc -v \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php72 \
    && yum -y install php  php-mysqlnd php-devel php-pear php-pecl-redis5 php-pdo\
    && wget https://github.com/swoole/swoole-src/archive/v4.4.5.tar.gz -O swoole  \
    && tar zxvf swoole \
    && cd swoole-src-4.4.5 \
    && phpize && ./configure --with-php-config=/usr/bin/php-config --enable-openssl --enable-http2  --enable-sockets --enable-mysqlnd  && make && make install \
    && echo "extentison=swoole" > /etc/php.ini \
    && curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/local/bin --filename=composer \
    && yum clean all \