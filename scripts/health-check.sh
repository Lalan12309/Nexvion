#!/usr/bin/env bash
# Poll a URL until it returns HTTP 200.
URL="${1:-http://localhost:8081/health}"
RETRIES="${2:-15}"
DELAY="${3:-2}"

for ((i = 1; i <= RETRIES; i++)); do
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 5 "$URL" || true)"
  if [[ "$code" == "200" ]]; then
    echo "[health] OK  $URL (attempt $i)"
    exit 0
  fi
  echo "[health] waiting... got '${code:-none}' (attempt $i/$RETRIES)"
  sleep "$DELAY"
done

echo "[health] FAILED $URL after $RETRIES attempts" >&2
exit 1
