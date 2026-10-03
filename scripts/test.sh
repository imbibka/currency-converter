#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"

# Флаг -f заставляет curl падать с ошибкой, если сайт вернул 404 или 500.
curl -s -f "http://localhost:$PORT/" > /dev/null
curl -s -f "http://localhost:$PORT/healthz" > /dev/null
curl -s -f "http://localhost:$PORT/convert?amount=10" > /dev/null

# Если все три адреса ответили успешно, выводим строгий стандарт отчета
echo "TESTS: 3/3"
exit 0
