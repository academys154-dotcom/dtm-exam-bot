#!/bin/sh
set -eu

mkdir -p /app/data /app/exports

exec python app/main.py
