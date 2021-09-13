local npairs = require('nvim-autopairs')

npairs.setup({
  check_ts = true,
  fast_wrap = {},
})

npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
