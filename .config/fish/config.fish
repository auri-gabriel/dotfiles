if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Enable Vi mode
    set -g fish_key_bindings fish_vi_key_bindings
end

# Startship.rs init
starship init fish | source

