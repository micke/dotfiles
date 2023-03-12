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

  local Rule = require("nvim-autopairs.rule")
  local cond = require("nvim-autopairs.conds")
  local utils = require("nvim-autopairs.utils")

  local function multiline_close_jump(open, close)
    return Rule(close, '')
      :with_pair(function()
        local row, col = utils.get_cursor(0)
        local line = utils.text_get_current_line(0)

        if #line ~= col then --not at EOL
          return false
        end

        local unclosed_count = 0
        for c in line:gmatch('[\\' .. open .. '\\' .. close .. ']') do
          if c == open then
            unclosed_count = unclosed_count + 1
          end
          if unclosed_count > 0 and c == close then
            unclosed_count = unclosed_count - 1
          end
        end
        if unclosed_count > 0 then
          return false
        end

        local nextrow = row + 1
        if nextrow < vim.api.nvim_buf_line_count(0) and vim.regex('^\\s*' .. close):match_line(0, nextrow) then
          return true
        end
        return false
      end)
      :with_move(cond.none())
      :with_cr(cond.none())
      :with_del(cond.none())
      :set_end_pair_length(0)
      :replace_endpair(function()
        return '<esc>xEa'
      end)
  end

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
    multiline_close_jump('(', ')'),
    multiline_close_jump('[', ']'),
    multiline_close_jump('{', '}'),
  }
end

return M
