return {
  { "AndrewRadev/deleft.vim", keys = { "dh", "<cmd>:Deleft<cr>" } },
  { "tpope/vim-abolish", cmd = { "Subvert", "Abolish" }, keys = "cr" },
  { "tpope/vim-bundler", event = "BufReadPre Gemfile*"},
  {
    "tpope/vim-dispatch",
    cmd = {
      "Make",
      "Copen",
      "Dispatch",
      "FocusDispatch",
      "AbortDispatch",
      "Start",
      "Start",
      "Spawn",
      "Focus",
    },
    keys = {
      "m<cr>",
      "m<space>",
      "m!",
      "m?",
      "`<cr>",
      "`<space>",
      "`!",
      "`?",
      "'<cr>", "'<space>",
      "'!", "'?",
      "g'<cr>", "g'<space>",
      "g'!", "g'?",
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    keys = {
      { "<leader>gs", "<cmd> Git <cr>" },
      { "<leader>gbl", "<cmd> Git blame <cr>" },
      { "<leader>gbr", "<cmd> GBrowse <cr>" },
      { "<leader>gbr", ":'<, '>GBrowse <cr>", mode = "v"},
      { "<leader>gpl", "<cmd> Git pull <cr>" },
      { "<leader>gps", "<cmd> Git push <cr>" },
      { "<leader>gpf", "<cmd> Git push --force-with-lease<cr>" },
      { "<leader>gpp", "<cmd> Git pp <cr>" },
      { "<leader>gpr", "<cmd> Git p-r <cr>" },
      { "<leader>gpu", "<cmd> Git pushu <cr>" },
      { "<leader>gcm", "<cmd> Git cm <cr>" },
    },
  },
  { "tpope/vim-git", lazy = false },
  { "tpope/vim-projectionist", lazy = false },
  { "tpope/vim-rails", lazy = false },
  { "tpope/vim-rake", lazy = false },
  { "tpope/vim-rbenv", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  { "tpope/vim-rsi", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "williamboman/mason-lspconfig.nvim" },

  { "terrortylor/nvim-comment", config = function() require("nvim_comment").setup() end, lazy = false },

  { "christoomey/vim-tmux-navigator", lazy = false },

  {
    "bennypowers/nvim-regexplainer",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "rmagatti/goto-preview",
    config = {
      default_mappings = true,
    },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },
}
