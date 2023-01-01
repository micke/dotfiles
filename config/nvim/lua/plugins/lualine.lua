local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

function M.config()
  require("lualine").setup {
    options = {
      theme = "hybridfox",
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 1
        }
      },
      lualine_x = {'encoding', 'filetype'},
    },
  }
end

return M
