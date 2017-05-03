#!/bin/bash

SESSION_COUNT=`tmux ls 2> /dev/null | wc -l`
PANE_COUNT=`tmux list-panes 2> /dev/null | wc -l`

cmd_help() {
  echo "Tmux Tilling Client V 0.1"
}

cmd_rotate(){
  if [ $SESSION_COUNT -gt 0 ]
  then
    tmux rotate-window
  fi
}

cmd_split_pan(){
  if [ $SESSION_COUNT -gt 0 ]
  then
    if [ $((PANE_COUNT%2)) -eq 0 ]
    then
      tmux split-window -v
    else
      tmux split-window -h
    fi
  else
   tmux attach 2> /dev/null || tmux new
  fi
}

case "$1" in
  "rotate")
      cmd_rotate ;;
  "split" | "")
      cmd_split_pan ;;
  "help")
      cmd_help ;;
esac
