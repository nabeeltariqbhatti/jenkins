FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx  && \
    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm    && \
    yum --disablerepo="*" --enablerepo="remi-safe" list php[7-9][0-9].x86_64 && \
    yum-config-manager --enable remi-php74 && \
    yum -y  install php php-mysqlnd php-fpm
  
EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh
RUN chmod 777 /var/run
COPY systemctl.py /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl
CMD /start.sh

