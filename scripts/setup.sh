#!/usr/bin/env bash
# Checks which DevOps tools are installed.
for tool in git docker curl kubectl helm terraform ansible; do
  if command -v "$tool" >/dev/null 2>&1; then
    echo "[ok]      $tool"
  else
    echo "[missing] $tool"
  fi
done
