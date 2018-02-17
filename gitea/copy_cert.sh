#!/bin/bash

echo "Copy cert"
cp /usr/syno/etc/certificate/system/default/privkey.pem key.pem
cp /usr/syno/etc/certificate/system/default/cert.pem cert.pem

echo "Fix permission"
chown $USER:$GROUP cert.pem key.pem

echo "Restart process"
./startup_gitea.sh restart