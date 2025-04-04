local treesj = require("plugins.treesitter.treesj")
local contextCommentString = require("plugins.treesitter.ts-context-commentstring")

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    treesj,
    contextCommentString,
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-endwise",
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        patterns = {
          ruby = {
            "do_block",
            "block",
          },
        }
      },
    },
  }
}

M.config = function ()
  local ts_config = require("nvim-treesitter.configs")

  ts_config.setup {
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "dockerfile",
      "elixir",
      "go",
      "graphql",
      "hcl",
      "html",
      "javascript",
      "json",
      "lua",
      "nix",
      "python",
      "regex",
      "ruby",
      "rust",
      "scss",
      "typescript",
      "vue",
      "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enable = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        include_surrounding_whitespace = false,
        selection_modes = {
          ["@function.outer"] = "V",
        },
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["am"] = "@function.outer",
          ["im"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          -- ["df"] = "@function.outer",
          -- ["dF"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
    -- matchup = {
    --   enable = true
    -- },
    autopairs = {
      enable = true
    },
    autotag = {
      enable = true
    },
    endwise = {
      enable = true
    },
  }
end

return M
