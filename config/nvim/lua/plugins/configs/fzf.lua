require("fzf-lua").setup({
  keymap = {
    builtin = {
      ["<C-u>"] = "preview-page-up",
      ["<C-d>"]   = "preview-page-down",
    }
  }
})
