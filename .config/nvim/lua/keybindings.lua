--Set the space bar to the leader key for custom commands.
vim.g.mapleader = " "

local wk = require("which-key")

--Fix the Y keybinding.
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

--Window navigation with Ctrl and navigation keys.
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

--Leader prefixed key bindings.
wk.register({
    ["q"] = { "<cmd>SClose | q<cr>", "Quit Neovim" },
    ["<leader>"] = { "<cmd>Files<cr>", "Find a file in working dir" },
    ["/"] = { "<cmd>Rg<cr>", "Search in files in working dir" },
    ["`"] = { "<C-^>", "Go to alternative file" },
    [","] = { "<cmd>Buffers<cr>", "List open buffers" },
    ["h"] = { "<cmd>SClose | cd ~<cr>", "Close session and go home" },

    ["f"] = {
        name = "+files",
        ["f"] = { "<cmd>Files ~<cr>", "Find a file" },
        ["s"] = { "<cmd>w<cr>", "Save current buffer" },
        ["S"] = { "<cmd>wa<cr>", "Save all buffers" },
        ["/"] = { "<cmd>BLines<cr>", "Search in buffer" },
        ["?"] = { "<cmd>Lines<cr>", "Search in open buffers" },
    },

    ["b"] = {
        name = "+buffer",
        ["k"] = { "<cmd>bd<cr>", "kill current buffer" },
        ["K"] = { "<cmd>bd!<cr>", "kill current buffer without saving" },
    },

    ["d"] = {
        name = "+dotfiles",
        ["g"] = { "<cmd>FloatermNew lazygit -w ~ -g ~/.cfg<cr>", "Open lazygit in dotfiles dir" },
        ["f"] = { "<cmd>Files ~/.config<cr>", "Find a dotfile" },
        ["n"] = {
            name = "+neovim",
            ["f"] = { "<cmd>Files ~/.config/nvim<cr>", "Find a Neovim dotfile" },
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
