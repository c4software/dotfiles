#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 host port [remote-port]"
  exit
fi

if [ -z "$1" ]; then
	echo "Remote server is mandatory"
	exit
fi

if [ -z "$2" ]; then
	echo "Port is mandatory"
	exit
fi

if [ -z "$3" ]; then
	REMOTEPORT=$2
else
	REMOTEPORT=$3
fi

while : 
do	
echo "$(date "+%Y-%m-%d %H:%M:%S") : $REMOTEPORT:localhost:$2 => $1"
ssh -NR 0.0.0.0:$REMOTEPORT:0.0.0.0:$2 $1
sleep 10
done
