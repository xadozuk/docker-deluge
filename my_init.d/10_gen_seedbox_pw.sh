#!/bin/bash

if [ -n "$SFTP_PASSWORD" ]; then
    PASSWORD=$SFTP_PASSWORD
else
    printf "env var SFTP_PASSWORD not set, generating a new password\n"
    PASSWORD=$(</dev/urandom tr -dc 'A-Za-z0-9@#$%&_+=' 2>/dev/null | head -c16)
    printf "Password: %s\n" $PASSWORD
fi

usermod --password $(echo $PASSWORD | openssl passwd -1 -stdin) seedbox
