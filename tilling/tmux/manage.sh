#!/bin/bash

SESSION_COUNT=`tmux ls | wc -l`
PANE_COUNT=`tmux list-panes | wc -l`

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
    if [ $PANE_COUNT -ge 2 ]
    then
      tmux split-window -v
    else
      tmux split-window -h
    fi
  else
    tmux
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
