#!/bin/bash

# Setup for xmrig
useradd -Umr xmrig

wget https://github.com/xmrig/xmrig/releases/download/v6.22.2/xmrig-6.22.2-linux-static-x64.tar.gz

tar -xvf xmrig-6.22.2-linux-static-x64.tar.gz

cd xmrig-6.22.2

cp config.json /etc/xmrig.json

cp xmrig /usr/local/bin

mkdir /var/log/xmrig

chown xmrig:xmrig /var/log/xmrig

# create systemd file
wget https://github.com/satoramoto/bootstrap/raw/refs/heads/main/xmrig/xmrig.service /etc/systemd/system/xmrig.service

systemctl daemon-reload
systemctl enable xmrig
systemctl start xmrig
