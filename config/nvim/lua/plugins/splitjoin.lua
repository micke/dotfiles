return {
  "AndrewRadev/splitjoin.vim",
  enabled = true,
  keys = {
    { "gS", "<cmd> SplitjoinSplit <cr>" },
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
    vim.g.splitjoin_html_attributes_bracket_on_new_line = true
  end
}
