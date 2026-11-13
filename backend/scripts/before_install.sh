#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Stopping old systemd backend"

systemctl stop backend || true
systemctl disable backend || true

echo "Removing old PM2 backend"

sudo -u ec2-user -H pm2 delete backend || true

echo "Cleaning old application"

rm -rf "$APP_DIR"

mkdir -p "$APP_DIR"

chown -R ec2-user:ec2-user /home/ec2-user

echo "BeforeInstall completed"
