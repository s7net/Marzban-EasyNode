#!/bin/bash

apt-get update && apt-get upgrade -y
apt-get install curl socat git -y

curl -fsSL https://get.docker.com | sh

git clone https://github.com/Gozargah/Marzban-node
mkdir /var/lib/marzban-node
cd ~/Marzban-node

sed -i 's/# SSL_CLIENT_CERT_FILE/SSL_CLIENT_CERT_FILE/' docker-compose.yml
sed -i '/SSL_CERT_FILE/d' docker-compose.yml
sed -i '/SSL_KEY_FILE/d' docker-compose.yml
clear||cls
echo "- Please Input Marzban cert : "
cat > /var/lib/marzban-node/ssl_client_cert.pem
docker compose up -d