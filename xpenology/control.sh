#!/bin/bash

case "$C" in
"start")
    VBoxManage startvm "xpenology" --type headless
    ;;
"stop")
    VBoxManage controlvm xpenology poweroff
    ;;
"console")
   ./console.sh
   ;;
*)
    echo "control.sh start|stop|console"
    ;;
esac
