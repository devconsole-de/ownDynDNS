FROM debian:11-slim as base

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y apache2 php7.4 php7.4-soap php7.4-xml
RUN ln -fs /dev/stderr /var/log/apache2/error.log && \
    ln -fs /dev/stdout /var/log/apache2/other_vhosts_access.log && \
    ln -fs /dev/stdout /var/log/apache2/access.log
COPY ./src /var/www/html/src
COPY ./update.php /var/www/html
COPY ./.htaccess /var/www/html

CMD ["apachectl", "-DFOREGROUND"]
