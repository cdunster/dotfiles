-- Install packer if not already installed.
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

-- List the plugins to install.
return require("packer").startup(function()
    -- Packer can manage itself.
    use "wbthomason/packer.nvim"
    -- Start Screen.
    use {
        "mhinz/vim-startify",
        config = require("config.startify").config(),
    }
    -- Git commands.
    use "tpope/vim-fugitive"
    -- Which Key.
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                plugins = { spelling = true },
                key_labels = { ["<leader>"] = "SPC", ["<space>"] = "SPC" },
                layout = { spacing = 5 },
            }
        end
    }
    -- Tree-sitter
    use {
        "nvim-treesitter/nvim-treesitter",
        branch = "0.5-compat",
        run = ":TSUpdate",
        requires = {
            { "nvim-treesitter/nvim-treesitter-textobjects", branch = "0.5-compat" },
        },
        config = require("config.treesitter").config(),
    }
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }
    -- Autocompletion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = require("config.cmp").config(),
    }
    -- Persistent Terminals
    use {
        "akinsho/toggleterm.nvim",
        requires = {
            -- Telescope picker for ToggleTerm
            "tknightz/telescope-termfinder.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = require("config.toggleterm").config(),
    }
    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "ray-x/lsp_signature.nvim",
        },
        config = require("config.lsp").config(),
    }
    -- Better Rust support. Uses Syntastic for highlighting.
    use "rust-lang/rust.vim"
    -- Advanced syntax highlighting.
    use "vim-syntastic/syntastic"
    -- Rust crate manager.
    use {
        "Saecki/crates.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }
    -- Dart language support.
    use "dart-lang/dart-vim-plugin"
    -- Flutter support with commands.
    use "thosakwe/vim-flutter"
    -- VimWiki for note-taking.
    use {
        "vimwiki/vimwiki",
        config = require("config.vimwiki").config(),
    }
    -- For debugging programmes in Neovim.
    use {
        "puremourning/vimspector",
        config = require("config.vimspector").config(),
    }
    -- Comment-out lines.
    use {
        "tpope/vim-commentary",
        config = function()
            local wk = require("which-key")
            wk.register({
                ["gc"] = {
                    name = "+Comment out/in",
                    ["c"] = "Comment out/in line",
                    ["u"] = "Comment out/in line",
                }
            })
        end
    }
    -- Gruvbox colour scheme.
    use "morhetz/gruvbox"
    -- Seoul 256 colour scheme.
    use "junegunn/seoul256.vim"
    -- PICO-8 support.
    use "Bakudankun/PICO-8.vim"
    -- Git in the gutter.
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require("config.gitsigns").config(),
    }
end)

