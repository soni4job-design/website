#!/bin/bash
# open.sh — Open the Meopel website in N browser windows
#
# Usage:
#   ./open.sh              # opens 1 window (default)
#   ./open.sh 4            # opens 4 windows
#   ./open.sh 4 http://localhost:3000  # opens 4 windows at a custom URL

COUNT=${1:-1}
URL=${2:-https://meopel.com}

echo "Opening $COUNT window(s) at $URL..."

# Detect OS and pick the right open command
if command -v start > /dev/null 2>&1; then
  # Windows (Git Bash)
  OPEN_CMD="start"
elif command -v xdg-open > /dev/null 2>&1; then
  # Linux
  OPEN_CMD="xdg-open"
elif command -v open > /dev/null 2>&1; then
  # macOS
  OPEN_CMD="open"
else
  echo "Cannot detect browser open command. Open manually: $URL"
  exit 1
fi

for i in $(seq 1 "$COUNT"); do
  $OPEN_CMD "$URL"
  sleep 0.3  # small delay so windows don't stack on top of each other
done

echo "Done — opened $COUNT window(s)."
