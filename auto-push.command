#!/bin/bash
# Auto-push : surveille index.html et pousse sur GitHub à chaque modification.
# Double-cliquer ce fichier (ou: bash auto-push.command). Laisser la fenêtre ouverte.
cd "$(dirname "$0")" || exit 1
echo "Surveillance de index.html — Ctrl+C pour arrêter."
LAST=""
while true; do
  NOW=$(stat -f %m index.html 2>/dev/null || stat -c %Y index.html 2>/dev/null)
  if [ "$NOW" != "$LAST" ] && [ -n "$NOW" ]; then
    if [ -n "$LAST" ]; then
      git add index.html && git commit -m "maj configurateur $(date '+%Y-%m-%d %H:%M')" && git push && echo "Poussé ✔"
    fi
    LAST="$NOW"
  fi
  sleep 3
done
