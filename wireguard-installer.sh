#!/bin/bash

mkdir -p ~/wireguard
cd ~/wireguard

echo "Welcome to the WireGuard installer!"
echo ""
echo "I need to ask you a few questions before starting the setup."
echo "You can keep the default options and just press enter if you are ok with them."
echo ""

# Get compose file
COMPOSE_FILE="https://github.com/ongtungduong/wireguard-installer/raw/main/compose.yaml"
curl -L "$COMPOSE_FILE" > compose.yaml 2>/dev/null

# Get environment variables

# Images
WG_IMAGE="ghcr.io/wg-easy/wg-easy:13"
echo "WG_IMAGE=$WG_IMAGE" > .env

# Host
while [ -z "$WG_HOST" ]; do
    read -p "[Required] Please enter Wireguard Server IPv4 public address: " WG_HOST
done
echo "WG_HOST=$WG_HOST" >> .env

# Port
WG_PORT=${WG_PORT:-51820}
read -p "Please enter Wireguard Server UDP Port [Default: 51820]: " WG_PORT
echo "WG_PORT=$WG_PORT" >> .env

# Allowed IPs
WG_ALLOWED_IPS=${WG_ALLOWED_IPS:-"0.0.0.0/0"}
read -p "Please enter Wireguard Server Allow IPs [Default: 0.0.0.0/0]: " WG_ALLOWED_IPS
echo "WG_ALLOWED_IPS=$WG_ALLOWED_IPS" >> .env

# Passwords
echo "Generating Wireguard admin passwords..."
WG_PASSWORD=$(openssl rand -base64 32 | tr -d 'iI1lLoO0' | tr -d -c '[:alnum:]' | cut -c1-32)
echo "WG_PASSWORD=$WG_PASSWORD" >> .env
echo "To see Wireguard Admin Password, run the following command: cat ~/wireguard/.env | grep WG_PASSWORD"

# Start Wireguard
echo "Starting Wireguard Server..."
docker compose up -d
echo ""
echo "Wireguard Admin UI is running on port 8080"
echo "It's recommended to not expose Wireguard Admin UI port to the public internet for security reasons."
