#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Starting backend application using PM2"

cd "$APP_DIR"

# Start the backend application
sudo -u ec2-user -H pm2 start server.js --name backend

echo "Configuring PM2 to start automatically after reboot"

pm2 startup systemd -u ec2-user --hp /home/ec2-user

# Save the running application list
sudo -u ec2-user -H pm2 save

echo "Backend application started successfully"
