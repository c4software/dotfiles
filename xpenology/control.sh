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
   ./console.sh
   ;;
*)
    echo "$0 start|stop|console"
    ;;
esac
