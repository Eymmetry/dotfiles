tmux split-window -v
tmux resize-pane -D 15
tmux send-keys -t 1 "julia" C-m
tmux send-keys -t 0 "vim main.jl" C-m
tmux select-pane -t 0
