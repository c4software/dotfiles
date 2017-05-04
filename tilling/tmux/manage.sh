#!/bin/bash

PANE_COUNT=`tmux list-panes 2> /dev/null | wc -l`

function session_exist {
    tmux has-session -t dev 2>/dev/null
}

cmd_help() {
  echo "Tmux Tilling Control V 0.1"
}

cmd_rotate(){
  if [ $SESSION_COUNT -gt 0 ]
  then
    tmux rotate-window
  fi
}

cmd_split_pan(){
  if session_exist
  then
    if [ $((PANE_COUNT%2)) -eq 0 ]
    then
      tmux split-window -v
    else
      tmux split-window -h
    fi
  else
   tmux attach -s dev 2> /dev/null || tmux new -s dev
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
