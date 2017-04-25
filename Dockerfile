FROM alpine:latest
RUN apk add --no-cache certbot
ADD entrypoint.sh entrypoint.sh
CMD ["/entrypoint.sh"]
