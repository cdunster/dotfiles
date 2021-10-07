local wk = require("which-key")

--Vimwiki key bindings for <leader>+w.
wk.register({
    name = "+vimwiki",
    ["d"] = "Delete this wiki file",
    ["r"] = "Rename this wiki file",
    ["h"] = "Generate HTML from wiki",
    ["n"] = "Go to wiki entry",
}, { prefix = "<leader>w", buffer = 0 })

--Extra bindings for vimwiki files normal mode.
wk.register({
    ["+"] = "Normalise link",
    ["-"] = "Demote header",
    ["="] = "Promote header",
    ["<BS>"] = "Back one link",
    ["<C-CR>"] = "Open link in vertical split",
    ["<C-Down>"] = "Diary go to next day",
    ["<C-S-CR>"] = "Open link in new tab",
    ["<C-Space>"] = "Toggle list item",
    ["<C-Up>"] = "Diary go to previous day",
    ["<CR>"] = "Open link",
    ["<D-CR>"] = "Open link in new tab",
    ["<M-Left>"] = "Move column left",
    ["<M-Right>"] = "Move column right",
    ["<S-CR>"] = "Open link in horizontal split",
    ["<Tab>"] = "Go to next link",
    ["<S-Tab>"] = "Go to previous link",
    ["o"] = "Insert new list item below",
    ["O"] = "Insert new list item above",
}, { buffer = 0 })

--Extra bindings for vimwiki files insert mode.
wk.register({
    ["<Tab>"] = { "pumvisible() ? '<C-n>' : vimwiki#tbl#kbd_tab()", "Go to next column" },
    ["<S-Tab>"] = { "pumvisible() ? '<C-p>' : vimwiki#tbl#kbd_shift_tab()", "Go to previous column" },
    ["<CR>"] = { "pumvisible() ? coc#_select_confirm() : '<C-]><Esc>:VimwikiReturn 1 5<CR>'", "Insert new item below" },
}, { mode = "i", expr = true, silent = true, buffer = 0 })
