local present, autopairs = pcall(require, "nvim-autopairs")

if not present then
  return
end

autopairs.setup({
  check_ts = true,
  fast_wrap = {
    map = "<M-w>"
  },
})

autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
autopairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
autopairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))

local Rule   = require'nvim-autopairs.rule'

autopairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']'),
}
