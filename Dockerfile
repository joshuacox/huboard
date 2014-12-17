FROM joshuacox/huboard-foreman-base

ENV SEGMENTIO_KEY HUBOARD_SEGMENTIO_KEY

ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 5000

CMD ["/usr/bin/supervisord"]
