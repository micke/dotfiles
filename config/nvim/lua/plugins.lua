local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup({function()
  use "wbthomason/packer.nvim"

  -- color related stuff
  use "~/code/EdenEast/nightfox.nvim"
  use "norcalli/nvim-colorizer.lua"

  -- lang stuff
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins.configs.treesitter"
    end,
    run = ":TSUpdate"
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
    "RRethy/nvim-treesitter-endwise",
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
    "andersevenrud/cmp-tmux"
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
    end
  }
  use { "onsails/lspkind-nvim" }
  use { "andymass/vim-matchup", event = "CursorMoved" }

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function() require("plugins.configs.others").signature() end,
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  -- languages not supported by treesitter
  use "sheerun/vim-polyglot"

  use "lewis6991/gitsigns.nvim"
  use "nvim-lualine/lualine.nvim"
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.configs.autopairs")
    end,
  }
  use "junegunn/vim-easy-align"
  use "AndrewRadev/splitjoin.vim"
  use "AndrewRadev/dsf.vim"
  use "AndrewRadev/switch.vim"
  use "AndrewRadev/deleft.vim"
  use {
    "FooSoft/vim-argwrap",
    config = function()
      require("plugins.configs.argwrap")
    end
  }
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
      {"olacin/telescope-gitmoji.nvim"},
    },
    cmd = "Telescope",
    config = function()
      require("telescope-nvim").config()
    end
  }

  use {
    "ibhagwan/fzf-lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  }

  -- misc
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

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("plugins.configs.neotest")
    end,
  }

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
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("plugins.configs.null-ls")
    end
  }

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        mode = {"lsp_workspace_diagnostics", "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"}
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
  use {
    "bennypowers/nvim-regexplainer",
    config = function() require'regexplainer'.setup() end,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    }
  }
end,
  config = {
    max_jobs = 30,
  }
})
