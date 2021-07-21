------ Neovim settings. These are at the end to make sure they are set ------
vim.opt.ignorecase = true                       -- Enable case insensitive matching.
vim.opt.smartcase = true                        -- Enable smart-case matching (match case insensitively unless upper-case used).
vim.opt.tabstop = 4                             -- Size of a tab.
vim.opt.softtabstop = 4                         -- See multiple spaces as a tab.
vim.opt.expandtab = true                        -- Converts tabs to spaces.
vim.opt.shiftwidth = 4                          -- Auto-indented width.
vim.opt.number = true                           -- Enable line numbers.
vim.opt.relativenumber = true                   -- Enable line numbers.
vim.opt.wildmode = 'longest,list'               -- Enable bash-like tab completions.
vim.opt.foldmethod = 'marker'                   -- Define folds with three braces in a comment.
vim.opt.termguicolors = true                    -- Enable full GUI colours in the terminal.
vim.opt.guifont = 'FiraCode Nerd Font Retina'   -- Set the font for the GUI vim.
vim.opt.mouse = 'a'                             -- Enable the mouse for all modes.
vim.opt.clipboard:append('unnamedplus')         -- Use the system clipboard.
vim.opt.scrolloff = 4                           -- Context lines around cursor when scrolling.
vim.opt.spell = true                            -- Enable spell checking.
vim.opt.spelllang = 'en_gb'                     -- Enable spell checking.
vim.opt.list = true                             -- Enable list mode which shows characters instead of whitespace.
vim.opt.lcs:append('space:·')                   -- Show whitespace characters.
vim.opt.hidden = true                           -- Keep buffers open in the background.
vim.opt.signcolumn = 'yes'                      -- Always show the signcolumn.
vim.opt.wrap = false                            -- Don't wrap long lines onto multiple lines.

-- Needed by CoC plugin.
vim.opt.backup = false          -- Disable creating file backups.
vim.opt.writebackup = false     -- Disable creating backups of files before writing.
vim.opt.updatetime = 300        -- Better user experience.
vim.opt.shortmess:append('c')   -- Disable hit-enter prompts and other messages for ins-completion-menu.
vim.opt.cmdheight = 2           -- Increase height of the command line.

------ Environment Variables ------
vim.env.FZF_DEFAULT_COMMAND = 'fd --hidden --exclude .git --no-ignore'
vim.env.TERM = 'alacritty'

------ Colour scheme ------
vim.cmd('syntax on')
vim.opt.cursorline = true
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

