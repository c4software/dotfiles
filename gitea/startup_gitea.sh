#!/bin/sh
#
# Put this file in /usr/local/etc/rc.d/
#

GITEA_ROOT="/your/gitea/bin/folder/of/gitea" # You can download the Gitea release from https://github.com/go-gitea/gitea/releases
GITEA_PID="cat $GITEA_ROOT/run.pid"
GITEA_USER="REPLACE_BY_YOUR_GITEA_USER" # Must be an existant user

if [ "$EUID" -ne 0 ]
then echo "The su « user » is only available for root in synology system. Please run as root"
    exit
fi

case "$1" in

stop)
	echo "Stop Gitea..."
	kill $(ps -o pid= --ppid "`$GITEA_PID`")
	;;
start)
	echo "Start Gitea"
	su $GITEA_USER -c "cd $GITEA_ROOT && nohup ./gitea web --pid $GITEA_ROOT/run.pid > /dev/null 2>&1 &"
	;;
restart)
	$0 stop
	sleep 1
	$0 start
	;;	
status)
	if ps -p `$GITEA_PID` > /dev/null
	then
		echo "Gitea is running"
	else
		echo "Gitea is not running"
	fi
	;;
*)
	echo "usage: $0 { start | stop | restart | status}" >&2
        exit 1
        ;;
esac
