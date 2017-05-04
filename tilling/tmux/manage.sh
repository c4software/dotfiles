#!/bin/bash

SESSION_NAME="dev"
PANE_COUNT=`tmux list-panes -t $SESSION_NAME 2> /dev/null | wc -l`

function session_exist {
    tmux has-session -t $SESSION_NAME 2>/dev/null
}

cmd_help() {
  echo "Tmux Tilling Control V 0.1"
}

cmd_rotate(){
    tmux rotate-window -t $SESSION_NAME
}

cmd_create_or_attach(){
  tmux attach -s $SESSION_NAME 2> /dev/null || tmux new -s $SESSION_NAME
}

cmd_split_pan(){
  if session_exist
  then
    if [ $((PANE_COUNT%2)) -eq 0 ]
    then
      tmux split-window -t $SESSION_NAME -v
    else
      tmux split-window -t $SESSION_NAME -h
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
