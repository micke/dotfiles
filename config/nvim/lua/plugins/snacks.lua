local treesitter = require("plugins.treesitter.init")
local navigation = require("plugins.tmux-navigation")

return {
  "folke/snacks.nvim",
  dependencies = {
    treesitter,
    navigation,
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = function()
    local navigation = require"nvim-tmux-navigation"
  return {
    image = { enabled = true },
    scroll = { enabled = true },
    animate = { enabled = true },
    statuscolumn = { enabled = true },
    picker = {
      matcher = {
        frecency = true,
      },
      layout = { preset = "telescope" },
      win = {
        input = {
          keys = {
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },
            -- ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            -- ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            -- ["<a-bs>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
            -- ["<a-left>"] = { function() vim.cmd ":normal! b" end, mode = { "i" }, desc = "delete word" },
            -- ["<a-f>"] = { function() vim.cmd ":normal! w" end, mode = { "i" }, desc = "delete word" },
          },
        },
      },
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["<CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                ["<c-h>"] = { navigation.NvimTmuxNavigateLeft, mode = { "n", "i" } },
                ["<c-j>"] = { navigation.NvimTmuxNavigateDown , mode = { "n", "i" } },
                ["<c-k>"] = { navigation.NvimTmuxNavigateUp, mode = { "n", "i" } },
                ["<c-l>"] = { navigation.NvimTmuxNavigateRight, mode = { "n", "i" } },
              },
            },
          },
        },
      },
      -- previewers = {
      --   file = {
      --     max_size = 10 * 1024 * 1024, -- 10 MB
      --     max_line_length = 10000
      --   }
      -- }
    },
  }
  end,
  keys = {
    { "<space>e", function() Snacks.explorer() end, desc = "File Explorer" },

    -- Files and Search
    { "<space>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<space>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<space>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "<space>sb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },

    -- Git
    { "<space>gb", function() Snacks.picker.git_branches({ all = true }) end, desc = "Git Branches" },
    { "<space>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<space>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<space>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<space>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<space>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

    -- GitHub
    { "<space>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<space>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<space>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<space>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

    { "<space>r", function() Snacks.picker.resume() end, desc = "Resume" },
  }
}
