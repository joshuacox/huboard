FROM octohost/ruby-2.1.2

#ADD . /srv/www
#RUN cd /srv/www; bundle install --deployment --without test development

#EXPOSE 5000
RUN git clone -b master https://github.com/rauhryan/huboard.git /app
RUN cd /app; bundle install --deployment --without test development

ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 80
EXPOSE 443

CMD ["/usr/local/bin/foreman","start","-d","/app"]
