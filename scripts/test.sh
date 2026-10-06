#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8080}"

python3 main.py &
SERVER_PID=$!

cleanup() {
  kill "$SERVER_PID" 2>/dev/null || true
}

trap cleanup EXIT

# Wait until the server is ready
for i in {1..20}; do
  if curl -s -f "http://localhost:$PORT/healthz" > /dev/null; then
    break
  fi
  sleep 0.5
done

curl -s -f "http://localhost:$PORT/" > /dev/null
curl -s -f "http://localhost:$PORT/healthz" > /dev/null
curl -s -f "http://localhost:$PORT/convert?amount=10" > /dev/null

echo "TESTS: 3/3"