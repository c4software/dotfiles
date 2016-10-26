#!/bin/bash

RENEWDATE=$(echo | openssl s_client -connect www.domain.tld:443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f 2)
RENEWDATE=$(date --date="$RENEWDATE" +%s)
NOW=$(date +%s)
DIFF=$(( ($RENEWDATE - $NOW) / (60*60*24) ))

DOMAINS="-d www.demain.tld -d w1.domain.tld -d w1.domain.tld"
EMAIL="email@mon_email.tld"
DIR=/tmp/letsencrypt-auto

if [ $DIFF -lt 4 ]
then
	mkdir -p $DIR && cd letsencrypt && ./letsencrypt-auto certonly --server https://acme-v01.api.letsencrypt.org/directory -a webroot --webroot-path=$DIR --email=$EMAIL --agree-tos --renew-by-default $DOMAINS
	service nginx restart
fi
