#!/bin/bash
clock() {
	date '+%H:%M'
}

volume() {
	amixer get 'Headphone',0 | grep 'off' >/dev/null && echo "muted" || amixer get 'Headphone' | grep -w 'Mono' | awk '{print$4}'
}

cpuload() {
	LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
	bc <<< $LINE
}

memused() {
	f=$(grep -E 'MemFree' /proc/meminfo |awk '{print $2}')
	t=$(grep -E 'MemTotal' /proc/meminfo |awk '{print $2}')
    bc <<< "scale=2; 100 -  $f/$t  * 100" | cut -d. -f1
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for win_id in $( wmctrl -l | cut -d' ' -f1 ); do
    	dt=`xprop -id $win_id _NET_WM_DESKTOP | awk '{print $3}'`
    	class=`xprop -id $win_id WM_CLASS | cut -d" " -f4-`
    	apps[$dt]="${apps[$dt]}"
    done

    for w in `seq 0 $((cur - 1))` ; do
    	if [ -z ${apps[$w]} ] ; then
    		line="${line}        ."
    	else
    		line="${line}    ${apps[$w]}    ."
    	fi
    done

    if [ -z ${apps[$cur]} ] ; then
    	line="${line}%{B#BE005577}%{+u}        %{B#22000000}%{-u}"
    else
    	line="${line}%{B#BE005577}%{+u}    ${apps[$cur]}    %{B#22000000}%{-u}"
    fi

    for w in `seq $((cur + 1)) $((tot - 1))` ; do
    	if [ -z ${apps[$w]} ] ; then
    		line="${line}.        "
    	else
    		line="${line}.    ${apps[$w]}    "
    	fi
    done

    unset apps
    echo $line
}

while :; do
	buf="%{l}%{B#22000000}%{-u}"
	buf="${buf} $(groups)   %{c}  "
	buf="${buf} $(clock) %{r}"
	buf="${buf} Vol: $(volume)  "
	buf="${buf} CPU: $(cpuload)%  "
	buf="${buf} Mem: $(memused)%"

	echo $buf
	sleep 1
done