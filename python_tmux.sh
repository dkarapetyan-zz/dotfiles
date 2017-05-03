#!/bin/sh 
tmux new-session -s 'python_dev' -d 'vim'
tmux split-window -p 30 'ipython' 
tmux -2 attach-session -d 
