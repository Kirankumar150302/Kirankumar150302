#!/bin/bash

useradd -g ${SIAB_GROUP} ${SIAB_USER}
usermod -aG ${SIAB_GROUP} ${SIAB_USER}
sudo usermod -aG sudo ${SIAB_USER}
mkdir /home/${SIAB_USER}

echo "${SIAB_USER}:${SIAB_PASSWORD}" | chpasswd

echo "SHELLINABOX_PORT=4200" > /etc/default/shellinabox

echo "Container creating...."
/usr/bin/shellinaboxd --debug --no-beep --disable-peer-check -u ${SIAB_USER} -g ${SIAB_GROUP} -c /var/lib/shellinabox -p ${SIAB_PORT} -t

