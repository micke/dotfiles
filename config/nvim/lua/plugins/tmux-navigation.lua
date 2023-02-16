return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    { "<C-h>", [[<C-o><cmd>NvimTmuxNavigateLeft<cr>]], mode = "i" },
    { "<C-j>", [[<C-o><cmd>NvimTmuxNavigateDown<cr>]], mode = "i" },
    { "<C-k>", [[<C-o><cmd>NvimTmuxNavigateUp<cr>]], mode = "i" },
    { "<C-l>", [[<C-o><cmd>NvimTmuxNavigateRight<cr>]], mode = "i" },

    { "<C-h>", [[<cmd>NvimTmuxNavigateLeft<cr>]], mode = { "n", "c" } },
    { "<C-j>", [[<cmd>NvimTmuxNavigateDown<cr>]], mode = { "n", "c" } },
    { "<C-k>", [[<cmd>NvimTmuxNavigateUp<cr>]], mode = { "n", "c" } },
    { "<C-l>", [[<cmd>NvimTmuxNavigateRight<cr>]], mode = { "n", "c" } },
  },
  opts = {},
}
