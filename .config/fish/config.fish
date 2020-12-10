# Enable VI keybindings in the fish shell.
function fish_user_key_bindings
    fish_vi_key_bindings
end

# Alias for dotfiles bare git repo. Used as a backup for my dotfiles.
alias config='/usr/bin/git --git-dir=/home/callum/.cfg/ --work-tree=/home/callum'

# Enable the starship cross-shell prompt.
starship init fish | source
