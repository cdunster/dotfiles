lua require('plugins')
lua require('startify')
lua require('floaterm')
lua require('vimspector')
lua require('vimwiki')
lua require('keybindings')

"------ Keybindings ------
"Fix the Y keybinding.
nnoremap Y y$

"Window navigation with Ctrl and navigation keys.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Navigate errors.
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

"Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

"Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"------ CoC Code Highlights and Selection ------
"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Map function and class text objects
"NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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

