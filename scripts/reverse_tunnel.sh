#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 host port"
  exit
fi

if [ -z $1 ]; then
	echo "Remote server is mandatory"
	exit
fi

if [ -z $2 ]; then
	echo "Port is mandatory"
	exit
fi

while : 
do	
echo "Starting Reverse tunnel : $2:localhost:$2 => $1"
ssh -NR 0.0.0.0:$2:localhost:$2 $1
sleep 10
done
