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
    dependencies = {
      "tpope/vim-rhubarb",
    }
  },
  { "tpope/vim-git", enabled = false, lazy = false },
  { "tpope/vim-projectionist", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-rsi", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "tpope/vim-sleuth", event = "BufReadPost" },
  { "williamboman/mason-lspconfig.nvim" },
  { "terrortylor/nvim-comment", config = function() require("nvim_comment").setup() end, lazy = false },
  {
    "rmagatti/goto-preview",
    keys = { "gpd", "gpt", "gpi", "gpi", "gP", "gpr" },
    config = { default_mappings = true },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({
        separator = " > ",
        depth_limit_indicator = "..",
        highlight = true,
        depth_limit = 6,
      })
    end,
  },
}
