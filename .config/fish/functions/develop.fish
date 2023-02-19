#fish shell configuration
function develop
    tmux -neww session_name: -n window_name -d
    tmux send-key -t session_name:window_name 'vim /path/to/project'
end
