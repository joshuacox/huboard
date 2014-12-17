FROM joshuacox/huboard-foreman-base
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

RUN cd /app;git pull

ADD .env /app/.env

RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 5000

CMD ["/usr/bin/supervisord"]
