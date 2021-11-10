require("plugins")
require("keybindings")
require("statusline")
require("settings")

--Toggle the line number mode in different situations.
vim.api.nvim_exec([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
]], false)

-- Format Rust files on save.
vim.api.nvim_command[[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]]
