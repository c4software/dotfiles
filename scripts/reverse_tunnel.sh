#!/bin/bash

function show_help() {
    echo "Usage:"
    echo "  $0 -r REMOTEHOST -p LOCALPORT[:REMOTEPORT]"
    echo "     -p: Can be multiple"
    exit
}

if [ $# -eq 0 ]; then
	show_help;
fi

# Get all p parameters
while getopts "p:r:" opt; do
    case $opt in
        r) HOST=$OPTARG;;
        p) PORTS+=("$OPTARG");;
    esac
done

# Create SSH command
SSH_REMOTE_ARGS=""
for val in "${PORTS[@]}"; do
    split_port=(${val//:/ })
    if [ ${#split_port[@]} -eq 1 ]; then
        REMOTEPORT=${split_port[0]}
        LOCALPORT=${split_port[0]}
    else
        REMOTEPORT=${split_port[1]}
        LOCALPORT=${split_port[0]}
    fi
    SSH_REMOTE_ARGS+=" -R 0.0.0.0:$REMOTEPORT:0.0.0.0:$LOCALPORT"
done

# Get Remote Server
if [ -z "$1" ]; then
	echo "Remote server is mandatory"
	exit
fi

# If no ports, then show help, and stop
if [ -z "$SSH_REMOTE_ARGS" ]; then
	show_help
fi


while :
do
	echo "$(date "+%Y-%m-%d %H:%M:%S") : $REMOTEPORT:localhost:$2 => $1"
	echo "ssh -N $SSH_REMOTE_ARGS $HOST"
	sleep 10
done
