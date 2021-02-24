# Enable VI keybindings in the fish shell.
function fish_user_key_bindings
    fish_vi_key_bindings
end

# Set the default terminal editor to be vim.
set -gx EDITOR vim

# Enable the starship cross-shell prompt.
starship init fish | source
