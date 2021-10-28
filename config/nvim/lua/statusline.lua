require("lualine").setup {
  options = {
    theme = "hybridfox"
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
