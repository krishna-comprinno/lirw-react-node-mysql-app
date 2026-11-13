#!/bin/bash
set -e

echo "Checking backend application status"

if ! sudo -u ec2-user -H pm2 describe backend | grep -q "online"; then

    echo "Backend application is not running"

    sudo -u ec2-user -H pm2 logs backend --lines 30 --nostream

    exit 1

fi

echo "Backend application is running"

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

echo "Backend health check failed"

sudo -u ec2-user -H pm2 logs backend --lines 30 --nostream

exit 1
