return {
  "vim-test/vim-test",
  keys = {
    { "<Leader>t", [[<Cmd> TestFile <CR>]] },
    { "<Leader>s", [[<Cmd> TestNearest <CR>]] },
  },
  init = function()
    vim.g["test#strategy"] = "dispatch"
  end,
}
