require("lualine").setup {
  options = {
    theme = "nightfox",
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
