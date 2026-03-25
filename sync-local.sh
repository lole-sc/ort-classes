#!/bin/bash
# Pulls new transcripts from GitHub and syncs them to the local transcripts folder.
# Runs via cron Mon-Thu at 23:20 UTC (20:20 UYT), 20 min after GitHub Actions finishes.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_TRANSCRIPTS="/Users/lolescaldaferro/Antigravity/Vimeo/transcripts"
LOG="/Users/lolescaldaferro/Antigravity/Vimeo/cron.log"

cd "$SCRIPT_DIR"
git pull --quiet 2>&1
rsync -a transcripts/ "$LOCAL_TRANSCRIPTS/"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] sync-local: transcripts synced from GitHub" >> "$LOG"
