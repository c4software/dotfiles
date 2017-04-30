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
"tmpnat")
    if [ -z $2 ];then
       echo "Usage: $0 $1 AppName PortOnHost [PortOnVM]"
       exit
    fi
    if [ -z $3 ];then
       echo "Usage: $0 $1 $2 PortOnHost [PortOnVM]"
       exit
    fi
    vmport=$4
    if [ -z $vmport ];then
      vmport=$3
    fi
    VBoxManage controlvm "xpenology" natpf1 "$2,tcp,,$3,,$vmport"
    ;;
"console")
   type socat >/dev/null 2>&1 || { echo >&2 "Socat is required. Aborting."; exit 1; }
   socat - UNIX-CONNECT:xpenology-serial
   ;;
*)
    echo "$0 init|start|stop|pause|tmpnat|console"
    ;;
esac
