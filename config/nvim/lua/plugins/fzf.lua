return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<Space>g", [[<Cmd> FzfLua grep search="" <CR>]] }
  },
  cmd = "FzfLua",
  opts = {
    "telescope",
  },
}
