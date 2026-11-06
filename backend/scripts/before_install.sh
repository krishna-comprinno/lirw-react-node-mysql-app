#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Stopping existing backend service"
systemctl stop backend || true

echo "Stopping old PM2 backend"
sudo -u ec2-user -H pm2 delete backend || true
sudo -u ec2-user -H pm2 kill || true

echo "Cleaning old deployment"
rm -rf "$APP_DIR"
mkdir -p "$APP_DIR"

chown -R ec2-user:ec2-user /home/ec2-user

echo "BeforeInstall completed"