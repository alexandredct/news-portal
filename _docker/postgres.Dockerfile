FROM postgres:9.2.23
# @see docs https://hub.docker.com/_/postgres

LABEL maintainer="alexandredct@gmail.com"

RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8

RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
