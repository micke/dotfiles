require("lualine").setup {
  options = {
    theme = "nightfox"
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
  }
}
