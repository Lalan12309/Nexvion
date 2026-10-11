#!/usr/bin/env bash
# Usage: ./scripts/deploy.sh {up|down|restart}
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
COMPOSE_FILE="$ROOT/docker/docker-compose.yml"

case "${1:-}" in
  up)
    docker compose -f "$COMPOSE_FILE" up -d --build
    "$ROOT/scripts/health-check.sh"
    ;;
  down)
    docker compose -f "$COMPOSE_FILE" down
    ;;
  restart)
    docker compose -f "$COMPOSE_FILE" restart
    "$ROOT/scripts/health-check.sh"
    ;;
  *)
    echo "Usage: $0 {up|down|restart}" >&2
    exit 1
    ;;
esac
