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
    ["[e"] = { "<Plug>(coc-diagnostic-prev)", "previous-error" },
    ["]e"] = { "<Plug>(coc-diagnostic-next)", "next-error" },
})

--Code navigation. With g prefix.
wk.register({
    ["d"] = { "<Plug>(coc-definition)", "goto-definition" },
    ["y"] = { "<Plug>(coc-type-definition)", "goto-type-definition" },
    ["i"] = { "<Plug>(coc-implementation)", "goto-implementation" },
    ["r"] = { "<Plug>(coc-references)", "list-references" },
}, { prefix = "g" })


--Map function and class text objects
--NOTE: Requires 'textDocument.documentSymbol' support from the language server.
wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "around class" },
}, { mode = "x" })

wk.register({
    ["if"] = { "<Plug>(coc-funcobj-i)", "inside function" },
    ["af"] = { "<Plug>(coc-funcobj-a)", "around function" },
    ["ic"] = { "<Plug>(coc-classobj-i)", "inside class" },
    ["ac"] = { "<Plug>(coc-classobj-a)", "around class" },
}, { mode = "o" })

--Leader prefixed key bindings.
wk.register({
    ["q"] = { "<cmd>SClose | q<cr>", "quit-neovim" },
    ["<leader>"] = { "<cmd>Files<cr>", "list-files-current-dir" },
    ["/"] = { "<cmd>Rg<cr>", "fuzzy-search-current-dir" },
    ["`"] = { "<C-^>", "alternative-file" },
    [","] = { "<cmd>Buffers<cr>", "list-open-buffers" },
    ["h"] = { "<cmd>SClose | cd ~<cr>", "close-session-go-home" },

    ["f"] = {
        name = "+files",
        ["f"] = { "<cmd>Files ~<cr>", "find-file" },
        ["s"] = { "<cmd>w<cr>", "save-current-buffer" },
        ["S"] = { "<cmd>wa<cr>", "save-all-buffers" },
        ["/"] = { "<cmd>BLines<cr>", "search-in-buffer" },
        ["?"] = { "<cmd>Lines<cr>", "search-in-open-buffers" },
    },

    ["b"] = {
        name = "+buffer",
        ["k"] = { "<cmd>bd<cr>", "kill-current-buffer" },
        ["K"] = { "<cmd>bd!<cr>", "kill-current-buffer-no-save" },
    },

    ["d"] = {
        name = "+dotfiles",
        ["g"] = { "<cmd>FloatermNew lazygit -w ~ -g ~/.cfg<cr>", "lazygit-dotfiles" },
        ["f"] = { "<cmd>Files ~/.config<cr>", "find-dotfile" },
        ["n"] = {
            name = "+neovim",
            ["f"] = { "<cmd>Files ~/.config/nvim<cr>", "find-nvim-dotfile" },
            ["i"] = { "<cmd>e ~/.config/nvim/init.lua<cr>", "init" },
            ["p"] = { "<cmd>e ~/.config/nvim/lua/plugins.lua<cr>", "plugins" },
        },
    },

    ["g"] = {
        name = "+git",
        ["g"] = { "<cmd>LazyGit<cr>", "lazygit-root" },
        ["s"] = { "<cmd>Git<cr>", "status" },
        ["b"] = { "<cmd>Git blame<cr>", "blame-this-file" },
        ["d"] = { "<cmd>Gdiffsplit<cr>", "diff-all-changes" },
        ["f"] = {
            name = "+file",
            ["r"] = { "<cmd>GRename<cr>", "rename-file" },
            ["m"] = { "<cmd>GMove<cr>", "move-file" },
            ["d"] = { "<cmd>GDelete<cr>", "delete-file" },
        },
    },

    ["t"] = {
        name = "+terminal",
        ["n"] = { "<cmd>terminal<cr>", "new-terminal" },
        ["f"] = { "<cmd>FloatermNew<cr>", "new-terminal-floating" },
        ["b"] = { "<cmd>FloatermNew --wintype=split --height=0.2<cr>", "new-terminal-bottom" },
    },

    ["c"] = {
        name = "+code",
        ["r"] = { "<Plug>(coc-rename)", "rename" },
        ["a"] = { "<Plug>(coc-codeaction-line)", "code-actions" },
        ["e"] = { "<cmd>CocList diagnostics<cr>", "list-errors" },
        ["o"] = { "<cmd>CocList outline<cr>", "code-outline" },
        ["s"] = { "<cmd>CocList -I symbols<cr>", "list-symbols" },
    },
}, { prefix = "<leader>" })
