local M = {
  "karb94/neoscroll.nvim",
  keys = { "<C-u>", "<C-d>", "gg", "G" },
}

function M.config()
  require("neoscroll").setup({
    mappings = { "<C-u>", "<C-d>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  })
end

return M
