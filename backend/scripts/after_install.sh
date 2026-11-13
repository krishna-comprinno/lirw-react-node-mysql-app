#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Setting application ownership"

chown -R ec2-user:ec2-user "$APP_DIR"

echo "Installing backend dependencies"

cd "$APP_DIR"

sudo -u ec2-user -H npm ci --omit=dev

echo "Creating environment configuration"

cat > "$APP_DIR/.env" <<'ENVEOF'
DB_HOST=lirw-mysql-db.clkwiuasu306.ap-south-1.rds.amazonaws.com
DB_PORT=3306
DB_USER=admin
DB_PASSWORD=apnkan911
DB_NAME=lirwdb
PORT=3200
ENVEOF

echo "Setting environment file permissions"

chown ec2-user:ec2-user "$APP_DIR/.env"

chmod 600 "$APP_DIR/.env"

echo "AfterInstall completed"
