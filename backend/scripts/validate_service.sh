#!/bin/bash
set -e

echo "Waiting for backend to start"
sleep 5

echo "Checking backend systemd service"

if ! systemctl is-active --quiet backend; then
    echo "Validation failed - backend service is not running"
    systemctl status backend --no-pager -l
    exit 1
fi

echo "Backend service is running"

echo "Checking backend health endpoint"

for i in {1..12}; do
    if curl -fsS http://localhost:3200/health; then
        echo ""
        echo "Validation passed - backend is healthy"
        exit 0
    fi

    echo "Attempt $i failed. Retrying in 5 seconds..."
    sleep 5
done

echo "Validation failed - backend health endpoint is not responding"
exit 1