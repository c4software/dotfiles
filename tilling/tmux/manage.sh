#!/bin/bash

SESSION_NAME="dev"
PANE_COUNT=`tmux list-panes -t $SESSION_NAME 2> /dev/null | wc -l`

session_exist() {
    cmd_do "has-session"
}

cmd_do(){
  tmux $1 -t $SESSION_NAME 2>/dev/null
}

cmd_help() {
  echo "Tmux Tilling Control V 0.1"
}

cmd_rotate(){
    cmd_do "rotate-window"
}

cmd_create_or_attach(){
  cmd_do "attach" || cmd_do "new"
}

cmd_split_pan(){
  if session_exist
  then
    if [ $((PANE_COUNT%2)) -eq 0 ]
    then
      cmd_do "split-window -v"
    else
      cmd_do "split-window -h"
    fi
  else
   cmd_create_or_attach
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
