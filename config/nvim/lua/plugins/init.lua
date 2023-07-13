return {
  { "AndrewRadev/deleft.vim", keys = { "dh", "<cmd>:Deleft<cr>" } },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        hook = function()
          require("ts_context_commentstring.internal").update_commentstring()
        end,
      })
    end,
    lazy = false,
  },
  {
    "rmagatti/goto-preview",
    keys = { "gpd", "gpt", "gpi", "gpi", "gP", "gpr" },
    opts = { default_mappings = true },
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
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
}
