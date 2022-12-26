local M = {
  "FooSoft/vim-argwrap",
  keys = {
    { "<Leader>w", "<cmd>ArgWrap<CR>", silent = true },
  },
}

function M.config()
  vim.g.argwrap_padded_braces = "{"
  vim.g.argwrap_tail_comma = true
end

return M
