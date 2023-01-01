return {
  "AndrewRadev/dsf.vim",
  keys = {
    { "dsf", "<Plug>DsfDelete" },
    { "csf", "<Plug>DsfChange" },
    { "dsnf", "<Plug>DsfNextDelete" },
    { "csnf", "<Plug>DsfNextChange" },
    { "af", "<Plug>DsfTextObjectA", mode = "o" },
    { "af", "<Plug>DsfTextObjectA", mode = "x" },
    { "if", "<Plug>DsfTextObjectI", mode = "o" },
    { "if", "<Plug>DsfTextObjectI", mode = "x" },
  },
  init = function()
    vim.g.dsf_no_mappings = true
  end,
}
