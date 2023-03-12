return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  keys = {
    { "<Space>g", [[<Cmd> FzfLua grep search="" <CR>]] }
  },
  cmd = "FzfLua",
  opts = {
    "telescope",
  },
}
