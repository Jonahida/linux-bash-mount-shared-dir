#!/bin/bash

# Source the configuration file
source config.sh

# Define usage function
usage() {
    echo "Usage: $0 [-u] [-s SHARE] [-r REMOTE_USER] [-l REMOTE_LOCATION] [-h]"
    echo "Options:"
    echo "  -u                Unmount the share instead of mounting"
    echo "  -s SHARE          Specify the share directory"
    echo "  -r REMOTE_USER    Specify the remote user"
    echo "  -l REMOTE_LOCATION Specify the remote location"
    echo "  -h                Display this help message"
}

# Default values
UNMOUNT=false
USER_ID=$(id -u "$USER")
GROUP_ID=$(id -g "$USER")

# Parse command-line options
while getopts "us:r:l:h" opt; do
    case $opt in
        u)
            UNMOUNT=true
            ;;
        s)
            SHARE="$OPTARG"
            ;;
        r)
            REMOTE_USERNAME="$OPTARG"
            ;;
        l)
            REMOTE_LOCATION="$OPTARG"
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
    esac
done

# Check if the share directory exists
if [ -d "$SHARE" ]; then
    if $UNMOUNT; then
        echo "Unmounting $SHARE and exiting..."
        sudo umount "$SHARE"
        sudo rmdir "$SHARE"
    else
        echo "Mount point already exists. Use -u option to unmount instead."
    fi
else
    echo "Mounting $SHARE..."
    sudo mkdir -p "$SHARE" && sudo chown "$USER_ID":"$GROUP_ID" "$SHARE"
    sudo mount -t cifs "$REMOTE_LOCATION" "$SHARE" -o username="$REMOTE_USERNAME",uid="$USER_ID",gid="$GROUP_ID"
fi
