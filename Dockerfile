FROM debian:12-slim as base

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 php8.2 php8.2-soap php8.2-xml
RUN ln -fs /var/log/apache2/error.log /dev/stderr && \
    ln -fs /var/log/apache2/other_vhosts_access.log /dev/stdout && \
    ln -fs /var/log/apache2/access.log /dev/stdout
COPY ./src /var/www/html/src
COPY ./update.php /var/www/html
COPY ./.htaccess /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]