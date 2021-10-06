lua require('plugins')
lua require('startify')
lua require('floaterm')
lua require('vimspector')
lua require('vimwiki')
lua require('keybindings')

"------ CoC Code Highlights and Selection ------
"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Set the custom statusline.
set statusline=                                                             "Clear the statusline.
set statusline+=[%n]                                                        "Add the buffer number to the statusline.
set statusline+=\ %<%f%m                                                    "Add file name and modified/readonly flag to the statusline.
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}       "Add warning and error count from LSP.
set statusline+=%=                                                          "Right-align the following.
set statusline+=%{FugitiveHead()}                                           "Add the git branch name.

"Toggle the line number mode in different situations.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

lua require('settings')

