#!/bin/bash
set -e

nginx -t
systemctl restart nginx
systemctl enable nginx

echo "Nginx restarted successfully"git