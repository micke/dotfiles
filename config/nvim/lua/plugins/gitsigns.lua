local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  cond = function()
    return vim.loop.fs_stat(".git")
  end,
}

function M.config()
  require("gitsigns").setup {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "󰐊" },
      topdelete = { text = "󰐊" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gs.nav_hunk('next')
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gs.nav_hunk('prev')
        end
      end)

      -- Actions
      map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
  }
end

return M
