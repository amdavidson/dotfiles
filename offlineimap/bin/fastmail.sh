#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    /usr/bin/offlineimap -k Repository_Remote:sslcacertfile=/etc/ssl/certs/ca-certificates.crt -c $HOME/.offlineimaprc_fastmail
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    /usr/local/bin/offlineimap -k Repository_Remote:sslcacertfile=/usr/local/etc/openssl/cert.pem -c $HOME/.offlineimaprc_fastmail
else 
    echo "Offlineimap not configured to access Fastmail on $OSTYPE" 
fi
