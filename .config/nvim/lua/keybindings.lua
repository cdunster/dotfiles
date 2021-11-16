--Set the space bar to the leader key for custom commands.
vim.g.mapleader = " "

--Set the comma key to the local leader key for custom commands.
vim.g.maplocalleader = ","

-- Helper functions.
_G.git_move = function()
    local current_name = vim.api.nvim_buf_get_name(0)
    local new_name = vim.fn.input("Move to: ", current_name, "file")
    if new_name ~= "" then
        vim.cmd("GMove " .. new_name)
    end
end

_G.git_rename = function()
    local new_name = vim.fn.input("New name: ", "", "file")
    if new_name ~= "" then
        vim.cmd("GRename " .. new_name)
    end
end

local wk = require("which-key")

wk.register({
    --Fix the Y keybinding.
    ["Y"] = { "y$", "Yank to end of line" },

    -- Move lines up and down.
    ["<M-j>"] = { "<cmd>m+<CR>", "Move current line down one" },
    ["<M-k>"] = { "<cmd>m-2<CR>", "Move current line up one" },

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
    [";"] = { "<cmd>lua require('telescope.builtin').resume()<cr>", "Resume the last telescope picker" },
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
        ["g"] = { "<cmd>lua toggle_config_git()<CR>", "Open lazygit in dotfiles dir" },
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
        ["l"] = { "<cmd>lua toggle_lazygit()<CR>", "Open floating lazygit for working dir" },
        ["g"] = { "<cmd>Git<cr>", "Git status" },
        ["d"] = { "<cmd>Gdiffsplit<cr>", "Git diff all changes" },
        ["b"] = { "<cmd>Git blame<cr>", "Git blame file" },
        ["P"] = { "<cmd>Git push<cr>", "Git push" },
        ["f"] = {
            name = "+file",
            ["r"] = { "<cmd>lua git_rename()<cr>", "Git rename file" },
            ["m"] = { "<cmd>lua git_move()<cr>", "Git move file" },
            ["d"] = { "<cmd>GDelete<cr>", "Git delete file" },
        },
    },
}, { prefix = "<leader>" })
