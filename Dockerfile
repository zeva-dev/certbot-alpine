FROM zeva/ddclient-alpine:latest
RUN apk add --no-cache certbot
#VOLUME /etc/letsencrypt /var/lib/letsencrypt

ADD entrypoint-certbot.sh entrypoint-certbot.sh

CMD ["/entrypoint-certbot.sh"]
