local M = {}

local Terminal  = require('toggleterm.terminal').Terminal
local config_git = Terminal:new({ cmd = "config", direction = "float" })
local lazygit = Terminal:new({ cmd = "lazygit", dir = "git_dir", direction = "float" })

function toggle_config_git()
    config_git:toggle()
end

function toggle_lazygit()
    lazygit:toggle()
end

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<ESC>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

M.config = function()
    require("toggleterm").setup({
        open_mapping = [[<C-\>]],
    })

    -- Add bindings for when in a terminal.
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local wk = require("which-key")
    wk.register({
        ["<C-\\>"] = "ToggleTerm",
    })

    wk.register({
        name = "+terminal",
        ["n"] = { "<cmd>1ToggleTerm<CR>", "New terminal" }, -- A count of '1' before the command creates a new terminal.
        ["a"] = { "<cmd>ToggleTermCloseAll<CR>", "Close all terminals" },
        ["A"] = { "<cmd>ToggleTermOpenAll<CR>", "Open all terminals" },
    }, { prefix = "<leader>t" })
end

return M
