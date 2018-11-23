#!/bin/bash

set -e

CRON_SCHEDULE=${CRON_SCHEDULE:-0 2 * * *}

if [[ "$1" == 'no-cron' ]]; then
    exec /backup.sh
else
    LOGFIFO='/var/log/cron.fifo'
    if [[ ! -e "$LOGFIFO" ]]; then
        mkfifo "$LOGFIFO"
    fi
    echo -e "$CRON_SCHEDULE /backup.sh > $LOGFIFO 2>&1" | crontab -
    crontab -l
    # cron
    tail -f "$LOGFIFO"
fi