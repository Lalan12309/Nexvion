#!/usr/bin/env bash
# Usage: ./scripts/backup.sh [how-many-backups-to-keep]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BACKUP_DIR="$ROOT/backups"
KEEP="${1:-5}"
ARCHIVE="$BACKUP_DIR/nexvion-$(date +%Y%m%d-%H%M%S).tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$ARCHIVE" -C "$ROOT" application docker
echo "[backup] created $ARCHIVE"

ls -1t "$BACKUP_DIR"/nexvion-*.tar.gz | tail -n +"$((KEEP + 1))" | xargs -r rm -f
echo "[backup] kept the latest $KEEP backups"
