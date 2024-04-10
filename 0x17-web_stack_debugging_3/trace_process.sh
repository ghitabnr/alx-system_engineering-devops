#!/bin/bash

# Check if a process with a given PID is running
function is_process_running() {
    local pid=$1
    if ps -p $pid > /dev/null; then
        return 0  # Process is running
    else
        return 1  # Process is not running
    fi
}

# Main function
function main() {
    local pid=$1

    # Check if the process is running
    if is_process_running $pid; then
        echo "Process with PID $pid is running. Attaching strace..."
        sudo strace -p $pid
    else
        echo "Process with PID $pid is not running."
    fi
}

# Usage
if [ $# -ne 1 ]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

main $1
