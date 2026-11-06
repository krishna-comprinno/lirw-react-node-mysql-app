#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app/backend"

echo "Creating backend systemd service"

cat > /etc/systemd/system/backend.service <<'EOF'
[Unit]
Description=Node.js Backend API
After=network.target

[Service]
Type=simple
User=ec2-user
Group=ec2-user
WorkingDirectory=/home/ec2-user/app/backend
EnvironmentFile=/home/ec2-user/app/backend/.env
ExecStart=/usr/bin/node /home/ec2-user/app/backend/server.js
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "Reloading systemd"
systemctl daemon-reload

echo "Enabling backend service"
systemctl enable backend

echo "Starting backend service"
systemctl restart backend

echo "Backend systemd service started"