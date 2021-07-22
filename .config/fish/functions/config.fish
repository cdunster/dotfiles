function config -w git
    if test (count $argv) -eq 0
        lazygit -g $HOME/.cfg/ -w $HOME
    else
        git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
    end
end
