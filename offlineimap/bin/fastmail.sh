#!/bin/bash



if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "OS is linux"
    DISTRO=$(. /etc/os-release; echo $NAME)
    if [[ "$DISTRO" == "Fedora" ]]; then
        echo "Distro is Fedora"
        /usr/bin/offlineimap -k Repository_Remote:sslcacertfile=/etc/ssl/certs/ca-bundle.crt -c $HOME/.offlineimaprc_fastmail
    elif [[ "$DISTRO" == "Debian GNU/Linux" ]]; then
        echo "Distro is Debian"
        /usr/bin/offlineimap -k Repository_Remote:sslcacertfile=/etc/ssl/certs/ca-certificates.crt -c $HOME/.offlineimaprc_fastmail
    else 
        echo "Distro is unknown"
        /usr/bin/offlineimap -k Repository_Remote:sslcacertfile=/etc/ssl/certs/ca-certificates.crt -c $HOME/.offlineimaprc_fastmail
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then 
    echo "OS is darwin"
    /usr/local/bin/offlineimap -k Repository_Remote:sslcacertfile=/usr/local/etc/openssl/cert.pem -c $HOME/.offlineimaprc_fastmail
else 
    echo "Offlineimap not configured to access Fastmail on $OSTYPE" 
fi
