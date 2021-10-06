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
    -- Floating terminal in Vim.
    use {
        "voldikss/vim-floaterm",
        config = function() require("floaterm") end,
    }
    -- Code completion.
    use {
        "neoclide/coc.nvim",
        branch = "release",
        config = function() require("coc") end,
    }
    -- Start Screen.
    use {
        "mhinz/vim-startify",
        config = function() require("startify") end,
    }
    -- FZF fuzzy file searcher.
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
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
        config = function() require("vimwiki") end,
    }
    -- For debugging programmes in Neovim.
    use {
        "puremourning/vimspector",
        config = function() require("vimspector") end,
    }
    -- Comment-out lines.
    use "tpope/vim-commentary"
    -- Gruvbox colour scheme.
    use "morhetz/gruvbox"
    -- Seoul 256 colour scheme.
    use "junegunn/seoul256.vim"
    -- PICO-8 support.
    use "Bakudankun/PICO-8.vim"
end)

