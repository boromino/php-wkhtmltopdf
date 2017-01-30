FROM boromino/php:7.0-apache

MAINTAINER Richard Papp "contact@boromino.com"

RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi && \
    wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-jessie-amd64.deb && \
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
WORKDIR /var/www/html

