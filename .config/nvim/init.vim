lua require('plugins')
lua require('startify')
lua require('floaterm')
lua require('vimspector')
lua require('vimwiki')
lua require('keybindings')
lua require('statusline')

"------ CoC Code Highlights and Selection ------
"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Toggle the line number mode in different situations.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

lua require('settings')

