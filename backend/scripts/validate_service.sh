#!/bin/bash
set -e

echo "Checking backend systemd service"

if ! systemctl is-active --quiet backend; then
    echo "Backend service is not active"
    systemctl status backend --no-pager -l
    journalctl -u backend -n 30 --no-pager
    exit 1
fi

echo "Backend systemd service is active"

echo "Checking backend health endpoint"

for i in {1..12}; do

    HTTP_STATUS=$(curl -s -o /tmp/backend-health-response \
        -w "%{http_code}" \
        --max-time 5 \
        http://localhost:3200/health || true)

    if [ "$HTTP_STATUS" = "200" ]; then
        echo "Backend health check successful"
        cat /tmp/backend-health-response
        exit 0
    fi

    echo "Attempt $i: HTTP status $HTTP_STATUS"
    sleep 5
done

echo "Backend health validation failed"

systemctl status backend --no-pager -l
journalctl -u backend -n 30 --no-pager

exit 1