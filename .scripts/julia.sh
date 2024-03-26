tmux split-window -h
#tmux resize-pane -D 15
tmux send-keys -t 1 "julia" C-m
tmux select-pane -t 0
