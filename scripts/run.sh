#!/usr/bin/env bash

set -euo pipefail

# сли переменная PORT не пришла извне, используем 8080
PORT="${PORT:-8080}"

pip install -r requirements.txt > /dev/null 2>&1 || true

# Экспортируем переменную PORT, чтобы Python её увидел
export PORT

exec python main.py
