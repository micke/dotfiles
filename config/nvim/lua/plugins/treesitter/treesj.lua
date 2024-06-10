local M = {
  "Wansmer/treesj",
  keys = { "<space>m", "<space>j", "<space>s" },
  config = function()
    -- local u = require("treesj.langs.utils")
    -- local javascriptdef = require("treesj.langs.javascript")

    local config = {
      max_join_length = 1000,
      check_syntax_error = false,
      -- langs = {
      --   javascript = u.merge_preset(javascriptdef, {
      --     statement_block = u.set_preset_for_statement({
      --       join = {
      --         no_insert_if = {
      --           u.no_insert.if_penultimate,
      --         },
      --       },
      --     }),
      --   }),
      -- },
    }

    require("treesj").setup(config)
  end,
}

return M
