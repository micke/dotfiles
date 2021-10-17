local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(function()
  use "wbthomason/packer.nvim"

  -- color related stuff
  use "folke/tokyonight.nvim"
  use "EdenEast/nightfox.nvim"
  use "norcalli/nvim-colorizer.lua"

  -- lang stuff
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
    end,
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  }
  use {
    "nvim-treesitter/playground",
    after = "nvim-treesitter",
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  }
  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter"
  }

  use {
    "rafamadriz/friendly-snippets",
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins.configs.cmp"
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    config = function()
      require("plugins.configs.others").luasnip()
    end,
  }

  use {
    "saadparwaiz1/cmp_luasnip",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
  }

  use {
    "hrsh7th/cmp-buffer",
  }

  use {
    "hrsh7th/cmp-path",
  }

  use {
    "hrsh7th/cmp-vsnip",
  }

  use {
    "andersevenrud/compe-tmux",
    branch = "cmp"
  }

  use {
    "neovim/nvim-lspconfig",
  }
  use "onsails/lspkind-nvim"
  use {
    "williamboman/nvim-lsp-installer",
  }
  use { "andymass/vim-matchup", event = "CursorMoved" }

  -- languages not supported by treesitter
  use "sheerun/vim-polyglot"

  use "lewis6991/gitsigns.nvim"
  use "hoob3rt/lualine.nvim"
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.others").autopairs()
    end,
  }
  use "AndrewRadev/splitjoin.vim"
  use "AndrewRadev/dsf.vim"
  use "AndrewRadev/switch.vim"
  use "AndrewRadev/deleft.vim"
  use "FooSoft/vim-argwrap"
  use {
    "rmagatti/goto-preview",
    after = "telescope.nvim",
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
      })
    end
  }

  -- Comment
  use "terrortylor/nvim-comment"

  -- file managing , picker etc
  use "kyazdani42/nvim-web-devicons"
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.configs.nvimtree")
    end,
  }
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

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("plugins.configs.others").blankline()
    end,
  }

  use "christoomey/vim-tmux-navigator"

  -- testing
  use { "preservim/vimux" }
  use { "vim-test/vim-test" }

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

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
      }
    end
  }

  -- use {
  --   "TimUntersberger/neogit",
  --   requires = "nvim-lua/plenary.nvim",
  --   config = function()
  --     require("neo-git").config()
  --   end
  -- }
end,
{
  display = {
    border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
  }
})
