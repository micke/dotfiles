vim.diagnostic.config({
  virtual_text = false,
})

vim.api.nvim_set_keymap(
  "n", "<Space>d", ":lua vim.diagnostic.open_float()<CR>",
  { noremap = true, silent = true }
)
