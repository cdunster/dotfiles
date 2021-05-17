"------ Plugins ------
call plug#begin(stdpath('data') . '/plugged')
"Floating terminal in vim.
Plug 'voldikss/vim-floaterm'
"Code completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Better syntax highlighting for C/C++. Requires CoC.
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Colour scheme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Which Key.
Plug 'liuchengxu/vim-which-key'
"Start Screen.
Plug 'mhinz/vim-startify'
"FZF fuzzy file searcher.
Plug 'junegunn/fzf.vim'
"Open LazyGit in a floating window.
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
"Git commands.
Plug 'tpope/vim-fugitive'
call plug#end()

"------ Startify Settings ------
"Automatically update sessions before quiting or loading a new session.
let g:startify_session_persistence = 1
"When opening a file or bookmark, change to the root directory.
let g:startify_change_to_vcs_root = 1
"Set header to unicode instead of ASCII.
let g:startify_fortune_use_unicode = 1
"Do not show empty buffer or quit links on the welcome page.
let g:startify_enable_special = 0

let g:startify_custom_header = startify#center([
    \ ' __  __          ___    ___                 __      __                 ___       __  ____     ',
    \ '/\ \/\ \        /\_ \  /\_ \               /\ \  __/\ \               /\_ \     /\ \ \/\ \    ',
    \ '\ \ \_\ \     __\//\ \ \//\ \     ___      \ \ \/\ \ \ \    ___   _ __\//\ \    \_\ \ \ \ \   ',
    \ ' \ \  _  \  / __`\\ \ \  \ \ \   / __`\     \ \ \ \ \ \ \  / __`\/\` __\\ \ \   / _` \ \ \ \  ',
    \ '  \ \ \ \ \/\  __/ \_\ \_ \_\ \_/\ \L\ \__   \ \ \_/ \_\ \/\ \L\ \ \ \/  \_\ \_/\ \L\ \ \ \_\ ',
    \ '   \ \_\ \_\ \____\/\____\/\____\ \____/\ \   \ `\___x___/\ \____/\ \_\  /\____\ \___,_\ \/\_\',
    \ '    \/_/\/_/\/____/\/____/\/____/\/___/\ \/    \/___//__/  \/___/  \/_/  \/____/\/__,_ /\ \/_/',
    \ '                                        \/                                                    ',
    \ ])

let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   Recent Files']            },
    \ { 'type': 'dir',       'header': ['   Files in '. getcwd()] },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

"------ Floaterm Settings ------
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_autoclose = 1

"------ Which Key Settings ------
"Set SPC to the leader key for custom commands.
let g:mapleader=' '

"Setup Which Key.
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

"Open Startify in a new tab.
nnoremap <silent> <C-n> :tabnew<CR>:Startify<CR>

"Clear search highlight with Ctrl-/.
nnoremap <silent> <C-/> :noh<CR>

"Write the current file.
let g:which_key_map['w'] = [':w', 'write-file']

"Quit the current window. Closes neovim if all windows are closed.
let g:which_key_map['q'] = [':q', 'quit-window']

"Find file in current dir with space space.
let g:which_key_map[' '] = [':Files', 'find-files-current-dir']

"Fuzzy search with ripgrep.
let g:which_key_map['/'] = [':Rg', 'fuzzy-search']

"Fuzzy search open buffers.
let g:which_key_map[','] = [':Buffers', 'open-buffers']

"Go to the homescreen, closing the current session.
let g:which_key_map['h'] = [':SClose', 'close-session-go-home']

"File commands.
let g:which_key_map['f'] = {
    \ 'name': '+files',
    \ 'f': [':Files ~', 'fuzzy-find-file'],
    \ '/': [':BLines', 'fuzzy-search-in-file'],
    \ '?': [':Lines', 'fuzzy-search-in-open-buffers'],
    \ }

"Buffer commands.
let g:which_key_map['b'] = {
    \ 'name': '+buffer',
    \ 'k': [':bd', 'kill-current-buffer'],
    \ 'K': [':bd!', 'kill-current-buffer-no-save'],
    \ 'o': [':on', 'kill-other-buffers'],
    \ 'O': [':on!', 'kill-other-buffers-no-save'],
    \ }

"Edit and commit dotfiles.
let g:which_key_map['d'] = {
    \ 'name': '+dotfiles',
    \ 'g': [':FloatermNew lazygit -w ~ -g ~/.cfg', 'lazygit-dotfiles'],
    \ 'v': [':e ~/.config/nvim/init.vim', 'init.vim'],
    \ }

"Git commands and open lazygit.
let g:which_key_map['g'] = [':LazyGit', 'lazygit']

"Floaterm commands.
let g:which_key_map['t'] = {
    \ 'name': '+terminal',
    \ 'n': [':terminal', 'new-terminal'],
    \ 'f': [':FloatermNew', 'new-terminal-floating'],
    \ 'b': [':FloatermNew --wintype=split --height=0.2', 'new-terminal-bottom'],
    \ }

"------ CoC Keybindings ------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-SPACE> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter.
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"------ Neovim settings. These are at the end to make sure they are set ------
set ignorecase              "Enable case insensitive matching.
set smartcase               "Emable smartcase matching (match case insensitively unless uppercase used).
set tabstop=4               "Size of a tab.
set softtabstop=4           "See multiple spaces as a tab.
set expandtab               "Converts tabs to spaces.
set shiftwidth=4            "Autoindented width.
set number relativenumber   "Enable line numbers.
set wildmode=longest,list   "Enable bash-like tab completions.
set foldmethod=marker       "Define folds with three braces in a comment.
set termguicolors           "Enable full GUI colours in the terminal.
set mouse=a                 "Enable the mouse for all modes.
set clipboard+=unnamedplus  "Use the system clipboard.
set scrolloff=4             "Context lines around cursor when scrolling.
set spell spelllang=en_gb   "Enable spell checking.
set statusline=[%n]\ %<%f%m "Set simple statusline.
set list lcs+=space:·       "Show whitespace characters.
set hidden                  "Keep buffers open in the background.
set signcolumn=yes          "Always show the signcolumn.

"Needed by CoC plugin.
set nobackup                "Disable creating file backups.
set nowritebackup           "Disable creating backups of files before writing.
set updatetime=300          "Better user experience.
set shortmess+=c            "Disable hit-enter prompts and other messages for ins-completion-menu.
set cmdheight=2             "Increase height of the command line.

"Toggle the line number mode in different situations.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Colour scheme.
colorscheme onehalfdark
syntax on
set t_Co=256
set cursorline
"Enable one of the lines below when airline or lightline is added.
" let g:airline_theme='onehalfdark'
" let g:lightline = { 'colorscheme': 'onehalfdark' }

"------ Environment Variables ------
let $FZF_DEFAULT_COMMAND = 'fd --hidden --exclude .git --no-ignore'
