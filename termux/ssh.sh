IP=`ip addr show wlan0 | grep -Po 'inet \K[\d.]+'`

if [ -z $IP ];then
	echo "Wlan0 not connected"
	pkill sshd
else
	echo "Listen $IP:8022"
	sshd
fi
