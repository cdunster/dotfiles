"{{{ Neovim settings.
set ignorecase	        	"Enable case insensitive matching.
set tabstop=4	        	"Size of a tab.
set softtabstop=4	        "See multiple spaces as a tab.
set expandtab	        	"Converts tabs to spaces.
set shiftwidth=4            "Autoindented width.
set number                  "Enable line numbers.
set wildmode=longest,list   "Enable bash-like tab completions.
set foldmethod=marker       "Define folds with three braces in a comment.
filetype plugin indent on   "Enable auto-indenting depending on file type.
"}}}
"{{{ Plugins
call plug#begin(stdpath('data') . '/plugged')

"Floating terminal in vim.
Plug 'voldikss/vim-floaterm'

call plug#end()
"}}}
"{{{ Keybinding
nnoremap <SPACE> <Nop>      "Un-map the SPC key from move right in normal mode.
let g:mapleader=' '         "Set SPC to the leader key for custom commands.

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <TAB> za
"}}}

