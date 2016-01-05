#!/bin/sh
function linear() {
  echo "($X + $@) - ($T - 1) * $@" | bc
}

function binary() {
  echo "($X * 2) / (2  *($T -1))" | bc
}

function pitch() {
  echo "$X * 0.25 / 0.282" | bc
}


bspc control --subscribe | while read line; do
  X=48
  P=150
  #[[ $(bspc query --monitors --desktop focused) = HDMI1 ]] || X=$(pitch) 
  W=$(bspc query --desktop focused --windows | wc -l)
  F=$(bspc query --desktop focused -T | grep "f-------" | wc -l)
  T=$((W-F))
  if [ $T -eq 1 ]; then
    bspc config --desktop focused window_gap 45
  else
    bspc config --desktop focused right_padding 0
    bspc config --desktop focused left_padding 0
    G=$(binary) # alternatively G=$(linear 10)
    [[ $G -lt 1 ]] && G=45
    bspc config --desktop focused window_gap $G
  fi
done
