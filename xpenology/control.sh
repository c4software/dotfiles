#!/bin/bash

case "$C" in
"start")
    VBoxManage startvm "xpenology" --type headless
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
    echo "control.sh start|stop|console"
    ;;
esac
