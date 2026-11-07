#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Stopping old backend application"

sudo -u ec2-user -H pm2 delete backend || true

echo "Cleaning old application files"

rm -rf "$APP_DIR"

echo "Creating application directory"

mkdir -p "$APP_DIR"

chown -R ec2-user:ec2-user /home/ec2-user

echo "BeforeInstall completed"
