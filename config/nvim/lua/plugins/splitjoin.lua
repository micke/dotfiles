return {
  "AndrewRadev/splitjoin.vim",
  keys = {
    { "gS", "<cmd> SplitjoinJoin <cr>" },
    { "gJ", "<cmd> SplitjoinJoin <cr>" },
  },
  lazy = false,
  -- init = function()
  --   vim.g.splitjoin_split_mapping = ''
  --   vim.g.splitjoin_join_mapping = ''
  -- end,
  config = function()
    vim.g.splitjoin_ruby_hanging_args = false
    vim.g.splitjoin_ruby_trailing_comma = true
    vim.g.splitjoin_ruby_options_as_arguments = true
    vim.g.splitjoin_ruby_curly_braces = false
    vim.g.splitjoin_align = true
  end
}
