#!/bin/bash

PASSWORD_FILE=/etc/container_environment/PASSSWORD_GENERATED

if [ ! -f $PASSWORD_FILE ]; then
    PASSWORD=$(</dev/urandom tr -dc 'A-Za-z0-9@#$%&_+=' 2>/dev/null | head -c16)
    usermod --password $(echo $PASSWORD | openssl passwd -1 -stdin) seedbox

    printf "Password: %s\n" $PASSWORD

    touch $PASSWORD_FILE
fi
