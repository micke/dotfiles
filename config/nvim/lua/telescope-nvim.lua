local M = {}
local actions = require('telescope.actions')
local action_state = require("telescope.actions.state")

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        actions.send_selected_to_qflist(prompt_bufnr)
        actions.open_qflist()
    else
        actions.file_edit(prompt_bufnr)
    end
end

local trouble = require("trouble.providers.telescope")

M.config = function()
  require("telescope").setup {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim"
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<M-Left>"] = function() vim.cmd ":normal! b" end,
          ["<M-Right>"] = function() vim.cmd ":normal! w" end,
          ["<M-BS>"] = { "<c-s-w>", type = "command" },
        },
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120
      },
      file_ignore_patterns = {},
      hidden = false,
      winblend = 0,
      border = {},
      borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require "telescope.previewers".vim_buffer_cat.new,
      grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
      qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        mappings = {
          i = {
            ["<c-q>"] = trouble.send_to_qflist,
            ["<c-t>"] = trouble.open_with_trouble,
            ["<cr>"] = custom_actions.fzf_multi_select,
          },
        },
      },
      live_grep = {
        mappings = {
          i = {
            ["<c-q>"] = trouble.send_to_qflist,
            ["<c-t>"] = trouble.open_with_trouble,
            ["<cr>"] = custom_actions.fzf_multi_select,
          },
        },
      }
    },
  }

  require("telescope").load_extension("fzf")
end

return M
