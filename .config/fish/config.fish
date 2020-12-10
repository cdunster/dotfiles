function fish_user_key_bindings
    fish_vi_key_bindings
end

alias config='/usr/bin/git --git-dir=/home/callum/.cfg/ --work-tree=/home/callum'

starship init fish | source
