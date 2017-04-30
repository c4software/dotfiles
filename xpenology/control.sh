#!/bin/bash

type VBoxManage >/dev/null 2>&1 || { echo >&2 "VirtualBox is required. Aborting."; exit 1; }

case "$1" in
"init")
    ./init.sh
    ;;
"start")
    VBoxManage startvm xpenology --type headless
    ;;
"stop")
    VBoxManage controlvm xpenology poweroff
    ;;
"pause")
    VBoxManage controlvm xpenology savestate
    ;;
"console")
   type socat >/dev/null 2>&1 || { echo >&2 "Socat is required. Aborting."; exit 1; }
   socat - UNIX-CONNECT:xpenology-serial
   ;;
*)
    echo "$0 init|start|stop|pause|tmpnat|console"
    ;;
esac
