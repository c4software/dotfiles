#!/bin/bash

type socat >/dev/null 2>&1 || { echo >&2 "Socat is required. Aborting."; exit 1; }

echo "Connect to the Serial Console"
socat - UNIX-CONNECT:/tmp/xpenology
