return {
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
  {
    "tpope/vim-projectionist",
    event = "BufReadPre",
    cond = function()
      return vim.loop.fs_stat(".projections.json")
    end,
  },
  {
    "tpope/vim-rails",
    event = "BufReadPost",
    cond = function()
      return vim.loop.fs_stat("config/environment.rb")
    end,
  },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-rsi", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "tpope/vim-sleuth", event = "BufReadPost" },
}
