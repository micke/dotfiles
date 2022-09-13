local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

vim.o.termguicolors = true

vim.cmd([[
autocmd BufEnter NvimTree set cursorline
]])

nvimtree.setup {
  diagnostics = {
    enable = true
  },
  disable_netrw = true,
  hijack_netrw = true,
  filters = {
    dotfiles = false,
    custom = { "^.git$", "node_modules", ".cache" }
  },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  hijack_directories = {
    enable = true,
    auto_open = false,
  },
  view = {
    side = "left",
    width = 40,
  },
  renderer = {
    root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
    highlight_opened_files = "none",
    highlight_git = true,
    add_trailing = false,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        folder = true,
        -- folder_arrow = true,
        file = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          -- arrow_open = "",
          -- arrow_closed = "",
          default = "",
          empty = "", -- 
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
      }
    }
  },
  git = {
    ignore = false
  },
  actions = {
    open_file = {
      quit_on_open = false
    },
  },
}
