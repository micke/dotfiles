local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(function()
  use "wbthomason/packer.nvim"

  -- color related stuff
  use "folke/tokyonight.nvim"
  use "norcalli/nvim-colorizer.lua"

  -- lang stuff
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-compe"
  use "onsails/lspkind-nvim"
  use "sbdchd/neoformat"
  use "kabouzeid/nvim-lspinstall"
  use { "andymass/vim-matchup", event = "CursorMoved" }

  -- languages not supported by treesitter
  use "kchmck/vim-coffee-script"
  use "elixir-editors/vim-elixir"

  use "lewis6991/gitsigns.nvim"
  use "hoob3rt/lualine.nvim"
  use "windwp/nvim-autopairs"
  use "alvan/vim-closetag"

  -- Comment
  use "terrortylor/nvim-comment"

  -- snippet support
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"

  -- file managing , picker etc
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
    },
    cmd = "Telescope",
    config = function()
      require("telescope-nvim").config()
    end
  }

  -- misc
  use "907th/vim-auto-save"
  use "karb94/neoscroll.nvim"
  use "folke/which-key.nvim"
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
  use "christoomey/vim-tmux-navigator"

  use "tpope/vim-unimpaired"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "tpope/vim-bundler"
  use "tpope/vim-rails"
  use "tpope/vim-rake"
  use "tpope/vim-dispatch"
  use "tpope/vim-rhubarb"
  use "tpope/vim-projectionist"
  use "tpope/vim-abolish"
  use "tpope/vim-rbenv"
  use "tpope/vim-git"
  use "tpope/vim-rsi"
  use "tpope/vim-fugitive"
  use "pgdouyon/vim-evanesco"
end,
{
  display = {
    border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
  }
})
