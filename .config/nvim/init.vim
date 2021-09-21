lua require('plugins')
lua require('startify')
lua require('floaterm')
lua require('vimspector')
lua require('vimwiki')

"------ Which Key Settings ------
"Set the space bar to the leader key for custom commands.
let g:mapleader=' '

"Set up Which Key.
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map =  {}
let g:which_key_use_floating_win = 0

"Set Which Key colours.
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

"Hide the statusline when Which Key is enabled.
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"------ Keybindings ------
"Fix the Y keybinding.
nnoremap Y y$

"Window navigation with Ctrl and navigation keys.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Move current Window with Alt and navigation keys.
nnoremap <M-h> <C-w><S-h>
nnoremap <M-j> <C-w><S-j>
nnoremap <M-k> <C-w><S-k>
nnoremap <M-l> <C-w><S-l>

"Buffer navigation with Ctrl and Tab.
nnoremap <silent> <C-TAB> :bn<CR>
nnoremap <silent> <C-S-TAB> :bp<CR>

"Navigate errors.
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

"Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Quit the current window. Closes Neovim if all windows are closed.
let g:which_key_map['q'] = [':SClose | q', 'quit-window']

"Find file in current directory with space space.
let g:which_key_map[' '] = [':Files', 'find-files-current-dir']

"Fuzzy search with ripgrep.
let g:which_key_map['/'] = [':Rg', 'fuzzy-search']

"Jump to alternative file (usually previously edited buffer).
let g:which_key_map['`'] = ['<C-^>', 'alternative-file']

"Fuzzy search open buffers.
let g:which_key_map[','] = [':Buffers', 'find-open-buffer']

"Go to the homescreen, closing the current session.
let g:which_key_map['h'] = [':SClose | cd ~', 'close-session-go-home']

"File commands.
let g:which_key_map['f'] = {
    \ 'name': '+files',
    \ 'f': [':Files ~', 'fuzzy-find-file'],
    \ 's': [':w', 'save-current-buffer'],
    \ 'S': [':wa', 'save-all-buffers'],
    \ '/': [':BLines', 'fuzzy-search-in-file'],
    \ '?': [':Lines', 'fuzzy-search-in-open-buffers'],
    \ }

"Buffer commands.
let g:which_key_map['b'] = {
    \ 'name': '+buffer',
    \ 'k': [':bd', 'kill-current-buffer'],
    \ 'K': [':bd!', 'kill-current-buffer-no-save'],
    \ }

"Edit and commit dotfiles.
let g:which_key_map['d'] = {
    \ 'name': '+dotfiles',
    \ 'g': [':FloatermNew lazygit -w ~ -g ~/.cfg', 'lazygit-dotfiles'],
    \ 'v': [':e ~/.config/nvim/init.vim', 'init.vim'],
    \ }

"Git commands and open LazyGit.
let g:which_key_map['g'] = {
    \ 'name': '+git',
    \ 'g': [':LazyGit', 'lazygit-root'],
    \ 's': [':Git', 'status'],
    \ 'b': [':Git blame', 'blame-this-file'],
    \ 'd': [':Gdiffsplit', 'diff-all-changes'],
    \ 'f': {
    \       'name': '+file',
    \       'r': [':GRename', 'rename-file'],
    \       'm': [':GMove', 'move-file'],
    \       'd': [':GDelete', 'delete-file'],
    \   },
    \ }

"Floaterm commands.
let g:which_key_map['t'] = {
    \ 'name': '+terminal',
    \ 'n': [':terminal', 'new-terminal'],
    \ 'f': [':FloatermNew', 'new-terminal-floating'],
    \ 'b': [':FloatermNew --wintype=split --height=0.2', 'new-terminal-bottom'],
    \ }

"Code commands through CoC plugin.
let g:which_key_map['c'] = {
    \ 'name': '+code',
    \ 'r': ['<Plug>(coc-rename)', 'rename'],
    \ 'a': ['<Plug>(coc-codeaction-line)', 'code-actions'],
    \ 'e': [':CocList diagnostics', 'list-errors'],
    \ 'o': [':CocList outline', 'code-outline'],
    \ 's': [':CocList -I symbols', 'list-symbols'],
    \ }

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

