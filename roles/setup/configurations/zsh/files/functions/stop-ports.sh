#!/bin/zsh

function stop() {
    local PORT=$1
    local PID=$(lsof -i :$PORT | awk 'NR>1 {print $2}')
    if [ -n "$PID" ]; then
        kill -9 "$PID"
        echo "Port $PORT stopped!"
    else
        echo "No process found on port $PORT!"
    fi
}

