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
        run = ":TSUpdate"
    }
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }
    -- Floating terminal in Vim.
    use {
        "voldikss/vim-floaterm",
        config = require("config.floaterm").config(),
    }
    -- Code completion.
    use {
        "neoclide/coc.nvim",
        branch = "release",
        config = require("config.coc").config(),
    }
    -- Start Screen.
    use {
        "mhinz/vim-startify",
        config = require("config.startify").config(),
    }
    -- Open LazyGit in a floating window.
    use "kdheepak/lazygit.nvim"
    -- Git commands.
    use "tpope/vim-fugitive"
    -- Better Rust support. Uses Syntastic for highlighting.
    use "rust-lang/rust.vim"
    -- Advanced syntax highlighting.
    use "vim-syntastic/syntastic"
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
end)

