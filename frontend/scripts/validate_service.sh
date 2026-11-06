#!/bin/bash
set -e

echo "Validating Nginx configuration"
nginx -t

echo "Checking frontend HTTP response"

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Frontend validation successful"
    exit 0
else
    echo "Frontend validation failed. HTTP status: $HTTP_STATUS"
    exit 1
fi