--Set the space bar to the leader key for custom commands.
vim.g.mapleader = ' '

local wk = require("which-key")

--Fix the Y keybinding.
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Window navigation with Ctrl and navigation keys.
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

--Navigate errors.
wk.register({
    ['[e'] = { '<Plug>(coc-diagnostic-prev)', 'previous-error' },
    [']e'] = { '<Plug>(coc-diagnostic-next)', 'next-error' },
})

--Code navigation. With g prefix.
wk.register({
    ['d'] = { '<Plug>(coc-definition)', 'goto-definition' },
    ['y'] = { '<Plug>(coc-type-definition)', 'goto-type-definition' },
    ['i'] = { '<Plug>(coc-implementation)', 'goto-implementation' },
    ['r'] = { '<Plug>(coc-references)', 'list-references' },
}, { prefix = 'g' })

--Leader prefixed key bindings.
wk.register({
    ['q'] = { '<cmd>SClose | q<cr>', 'quit-neovim' },
    ['<leader>'] = { '<cmd>Files<cr>', 'list-files-current-dir' },
    ['/'] = { '<cmd>Rg<cr>', 'fuzzy-search-current-dir' },
    ['`'] = { '<C-^>', 'alternative-file' },
    [','] = { '<cmd>Buffers<cr>', 'list-open-buffers' },
    ['h'] = { '<cmd>SClose | cd ~<cr>', 'close-session-go-home' },

    ['f'] = {
        name = '+files',
        ['f'] = { '<cmd>Files ~<cr>', 'find-file' },
        ['s'] = { '<cmd>w<cr>', 'save-current-buffer' },
        ['S'] = { '<cmd>wa<cr>', 'save-all-buffers' },
        ['/'] = { '<cmd>BLines<cr>', 'search-in-buffer' },
        ['?'] = { '<cmd>Lines<cr>', 'search-in-open-buffers' },
    },

    ['b'] = {
        name = '+buffer',
        ['k'] = { '<cmd>bd<cr>', 'kill-current-buffer' },
        ['K'] = { '<cmd>bd!<cr>', 'kill-current-buffer-no-save' },
    },

    ['d'] = {
        name = '+dotfiles',
        ['g'] = { '<cmd>FloatermNew lazygit -w ~ -g ~/.cfg<cr>', 'lazygit-dotfiles' },
        ['f'] = { '<cmd>Files ~/.config<cr>', 'find-dotfile' },
        ['n'] = { '<cmd>Files ~/.config/nvim<cr>', 'find-nvim-dotfile' },
        ['v'] = { '<cmd>e ~/.config/nvim/init.vim<cr>', 'init.vim' },
    },

    ['g'] = {
        name = '+git',
        ['g'] = { '<cmd>LazyGit<cr>', 'lazygit-root' },
        ['s'] = { '<cmd>Git<cr>', 'status' },
        ['b'] = { '<cmd>Git blame<cr>', 'blame-this-file' },
        ['d'] = { '<cmd>Gdiffsplit<cr>', 'diff-all-changes' },
        ['f'] = {
            name = '+file',
            ['r'] = { '<cmd>GRename<cr>', 'rename-file' },
            ['m'] = { '<cmd>GMove<cr>', 'move-file' },
            ['d'] = { '<cmd>GDelete<cr>', 'delete-file' },
        },
    },

    ['t'] = {
        name = '+terminal',
        ['n'] = { '<cmd>terminal<cr>', 'new-terminal' },
        ['f'] = { '<cmd>FloatermNew<cr>', 'new-terminal-floating' },
        ['b'] = { '<cmd>FloatermNew --wintype=split --height=0.2<cr>', 'new-terminal-bottom' },
    },

    ['c'] = {
        name = '+code',
        ['r'] = { '<Plug>(coc-rename)', 'rename' },
        ['a'] = { '<Plug>(coc-codeaction-line)', 'code-actions' },
        ['e'] = { '<cmd>CocList diagnostics<cr>', 'list-errors' },
        ['o'] = { '<cmd>CocList outline<cr>', 'code-outline' },
        ['s'] = { '<cmd>CocList -I symbols<cr>', 'list-symbols' },
    },
}, { prefix = "<leader>" })
