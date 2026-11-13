#!/bin/bash
set -e

echo "Cleaning old frontend files"

mkdir -p /usr/share/nginx/html

rm -rf /usr/share/nginx/html/*

echo "Frontend cleanup completed"
