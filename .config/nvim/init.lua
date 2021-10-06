require("plugins")
require("startify")
require("floaterm")
require("vimspector")
require("vimwiki")
require("keybindings")
require("statusline")
require("settings")

--Highlight the symbol and its references when holding the cursor.
vim.api.nvim_exec("autocmd CursorHold * silent call CocActionAsync('highlight')", false)

--Toggle the line number mode in different situations.
vim.api.nvim_exec([[
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
]], false)
