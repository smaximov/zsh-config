#!/usr/bin/zsh

set -u

if (( ${+DISABLE_AUTO_UPDATE} )); then
    # Auto updating is disabled
    exit 1
fi

# update every 7 days by default
UPDATE_INTERVAL=$(( ${UPDATE_INTERVAL_DAYS:-7} * 24 * 60 * 60 ))
CURRENT_TIME=$(date +%s)
LAST_UPDATE_TIME=$(stat -c %Z $ZSH_CACHE_DIR/last-update)

if (( ($CURRENT_TIME - $LAST_UPDATE_TIME) >= $UPDATE_INTERVAL )); then
    exit 0                      # need update
else
    exit 1                      # up-to-date
fi
