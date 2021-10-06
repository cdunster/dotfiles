--Set the space bar to the leader key for custom commands.
vim.g.mapleader = " "

local wk = require("which-key")

--Fix the Y keybinding.
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

--Use K to show documentation in preview window.
vim.api.nvim_set_keymap("n", "K", "<cmd>lua show_documentation()<cr>", { noremap = true })

function show_documentation()
    if vim.bo.filetype == "vim" or vim.bo.filetype == "help" then
        vim.api.nvim_command("execute 'h '.expand('<cword>')")
    elseif vim.fn["coc#rpc#ready()"] then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_command("execute '!' . &keywordprg . ' ' . expand('<cword>')")
    end
end

--Trigger CoC completion with Ctrl+Space.
vim.api.nvim_set_keymap("i", "<C-space>", "coc#refresh()", { noremap = true, expr = true, silent = true })

--Make <enter> select first completion item.
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'", { noremap = true, expr = true, silent = true })

--Navigate CoC Completion list with Tab and Shift+Tab.
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<S-TAB>'", { noremap = true, expr = true, silent = true })

--Window navigation with Ctrl and navigation keys.
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

--Navigate errors.
wk.register({
    ["[e"] = { "<Plug>(coc-diagnostic-prev)", "Go to previous error" },
    ["]e"] = { "<Plug>(coc-diagnostic-next)", "Go to next error" },
})

--Code navigation. With g prefix.
wk.register({
    ["d"] = { "<Plug>(coc-definition)", "Go to definition" },
    ["y"] = { "<Plug>(coc-type-definition)", "Go to type definition" },
    ["i"] = { "<Plug>(coc-implementation)", "Go to implementation" },
    ["r"] = { "<Plug>(coc-references)", "List references" },
}, { prefix = "g" })


--Map function and class text objects
--NOTE: Requires 'textDocument.documentSymbol' support from the language server.
wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "Inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "Around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "Inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "Around class" },
}, { mode = "x" })

wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "Inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "Around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "Inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "Around class" },
}, { mode = "o" })

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

    ["c"] = {
        name = "+code",
        ["r"] = { "<Plug>(coc-rename)", "Rename token" },
        ["a"] = { "<Plug>(coc-codeaction-line)", "List code actions" },
        ["e"] = { "<cmd>CocList diagnostics<cr>", "List errors" },
        ["o"] = { "<cmd>CocList outline<cr>", "List code outline" },
        ["s"] = { "<cmd>CocList -I symbols<cr>", "List code symbols" },
    },
}, { prefix = "<leader>" })
