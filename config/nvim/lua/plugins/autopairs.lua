local M = {
  "windwp/nvim-autopairs",
}

function M.config()
  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    check_ts = true,
    fast_wrap = {
      map = "<M-w>"
    },
  })

  local Rule = require'nvim-autopairs.rule'

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
end

return M
