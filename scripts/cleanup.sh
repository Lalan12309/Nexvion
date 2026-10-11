#!/usr/bin/env bash
set -euo pipefail

echo "[cleanup] Removing stopped containers"
docker container prune -f
echo "[cleanup] Removing dangling images"
docker image prune -f
echo "[cleanup] Removing unused networks"
docker network prune -f
echo "[cleanup] Done"
