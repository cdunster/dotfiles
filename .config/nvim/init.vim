lua require('plugins')
lua require('startify')
lua require('floaterm')
lua require('vimspector')
lua require('vimwiki')
lua require('keybindings')

"------ CoC Code Completion and Documentation ------
"Use tab for trigger completion with characters ahead and navigate.
"NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Use <C-SPACE> to trigger completion.
inoremap <silent><expr> <C-SPACE> coc#refresh()

"Make the enter key auto-select the first completion item and notify coc.nvim to format on enter.
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

