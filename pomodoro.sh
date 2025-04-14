#!/bin/bash

# Set session time
POMO_LENGTH=25  # minutes
BREAK_LENGTH=5  # minutes

# Use a temp file to store the timer state
STATE_FILE="/tmp/tmux_pomodoro_state"

# Initialize or update the timer
if [[ ! -f $STATE_FILE ]]; then
    echo "$(date +%s):work" > $STATE_FILE
fi

start_time=$(cut -d: -f1 $STATE_FILE)
mode=$(cut -d: -f2 $STATE_FILE)
now=$(date +%s)
elapsed=$(( (now - start_time) / 60 ))

if [[ $mode == "work" && $elapsed -ge $POMO_LENGTH ]]; then
    echo "$(date +%s):break" > $STATE_FILE
    echo "🍅 Break!"
elif [[ $mode == "break" && $elapsed -ge $BREAK_LENGTH ]]; then
    echo "$(date +%s):work" > $STATE_FILE
    echo "🍅 Focus!"
else
    mins_left=$(( ( (mode == "work" ? POMO_LENGTH : BREAK_LENGTH ) - elapsed) ))
    icon="🍅"
    [[ $mode == "break" ]] && icon="☕"
    echo "$icon $mins_left min"
fi

