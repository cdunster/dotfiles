--Set the space bar to the leader key for custom commands.
vim.g.mapleader = " "

--Set the comma key to the local leader key for custom commands.
vim.g.maplocalleader = ","

local wk = require("which-key")

wk.register({
    --Fix the Y keybinding.
    ["Y"] = { "y$", "Yank to end of line" },

    --Window navigation with Ctrl and navigation keys.
    ["<C-h>"] = { "<C-w>h", "Go to window on the left" },
    ["<C-j>"] = { "<C-w>j", "Go to window below" },
    ["<C-k>"] = { "<C-w>k", "Go to window above" },
    ["<C-l>"] = { "<C-w>l", "Go to window on the right" },
})

--Leader prefixed key bindings.
wk.register({
    ["q"] = { "<cmd>SClose | q<cr>", "Quit Neovim" },
    ["<leader>"] = { "<cmd>lua require('config.telescope').project_files()<cr>", "Find a file in working dir" },
    ["/"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search in files in working dir" },
    ["`"] = { "<C-^>", "Go to alternative file" },
    [","] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List open buffers" },
    ["h"] = { "<cmd>SClose | cd ~<cr>", "Close session and go home" },

    ["f"] = {
        name = "+files",
        ["f"] = { "<cmd>lua require('telescope.builtin').find_files({ cwd = '~' })<cr>", "Find a file" },
        ["s"] = { "<cmd>w<cr>", "Save current buffer" },
        ["S"] = { "<cmd>wa<cr>", "Save all buffers" },
    },

    ["b"] = {
        name = "+buffer",
        ["k"] = { "<cmd>bd<cr>", "Kill current buffer" },
        ["K"] = { "<cmd>bd!<cr>", "Kill current buffer without saving" },
    },

    ["d"] = {
        name = "+dotfiles",
        ["g"] = { "<cmd>FloatermNew lazygit -w ~ -g ~/.cfg<cr>", "Open lazygit in dotfiles dir" },
        ["f"] = { "<cmd>lua require('telescope.builtin').find_files({ cwd = '~/.config' })<cr>", "Find a dotfile" },
        ["n"] = {
            name = "+neovim",
            ["f"] = { "<cmd>lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<cr>", "Find a Neovim dotfile" },
            ["i"] = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Open Neovim init dotfile" },
            ["p"] = { "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "Open Neovim plugins dotfile" },
        },
    },

    ["g"] = {
        name = "+git",
        ["g"] = { "<cmd>LazyGit<cr>", "Open floating lazygit for working dir" },
        ["s"] = { "<cmd>Git<cr>", "Git status" },
        ["b"] = { "<cmd>Git blame<cr>", "Git blame this file" },
        ["d"] = { "<cmd>Gdiffsplit<cr>", "Git diff all changes" },
        ["f"] = {
            name = "+file",
            ["r"] = { "<cmd>GRename<cr>", "Git rename file" },
            ["m"] = { "<cmd>GMove<cr>", "Git move file" },
            ["d"] = { "<cmd>GDelete<cr>", "Git delete file" },
        },
    },

    ["t"] = {
        name = "+terminal",
        ["n"] = { "<cmd>terminal<cr>", "Create new terminal buffer" },
        ["f"] = { "<cmd>FloatermNew<cr>", "Create new floating terminal" },
        ["b"] = { "<cmd>FloatermNew --wintype=split --height=0.2<cr>", "Create new terminal on the bottom" },
    },
}, { prefix = "<leader>" })
