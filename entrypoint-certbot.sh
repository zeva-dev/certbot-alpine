#!/bin/sh

#set -e
: "${CERTBOT_TEST_OR_PROD?Need to set CERTBOT_TEST env var for certbot. test or prod}"
: "${CERTBOT_EMAIL?Need to set CERTBOT_EMAIL env var for certbot.}"

if  [ "$DYNU_DAEMON_OR_ONESHOT" = "daemon" ]
then
    echo "Error, can't use daemon mode with certbot"
    exit
fi
if [ "$CERTBOT_TEST_OR_PROD" = "test" ]
then
    OPTIONS="${OPTIONS} --test-cert"
elif ! [ "$CERTBOT_TEST_OR_PROD" = "prod" ]
then
    echo "error, CERTBOT_TEST_OR_PROD should be set to prod or to test"
    exit
fi


/entrypoint.sh
certbot certonly --standalone --email ${CERTBOT_EMAIL} --preferred-challenges tls-sni  --agree-tos --domain r-zeva.dynu.net --non-interactive ${OPTIONS}
sh
