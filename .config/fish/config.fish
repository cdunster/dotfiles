# Enable VI keybindings in the fish shell.
function fish_user_key_bindings
    fish_vi_key_bindings
end

# Enable the starship cross-shell prompt.
starship init fish | source
