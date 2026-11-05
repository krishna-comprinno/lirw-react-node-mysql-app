#!/bin/bash
set -e

echo "Cleaning previous frontend deployment"

mkdir -p /usr/share/nginx/html

find /usr/share/nginx/html -mindepth 1 -maxdepth 1 -exec rm -rf {} +

echo "Frontend directory cleaned successfully"