return {
  "andymass/vim-matchup",
  event = "BufReadPost",
  config = function()
    vim.g.matchup_surround_enabled = true
    vim.g.matchup_matchparen_deferred = true
    vim.g.matchup_matchparen_hi_surround_always = false
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
