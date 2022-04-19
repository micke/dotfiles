local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
--
g.nvim_tree_show_icons = {
  folders = 1,
  -- folder_arrows= 1
  files = 1,
  git = 1,
}

vim.cmd([[
autocmd BufEnter NvimTree set cursorline
]])

g.nvim_tree_icons = {
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
    -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
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

nvimtree.setup {
  diagnostics = {
    enable = true
  },
  disable_netrw = true,
  hijack_netrw = true,
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache" }
  },
  auto_close = false,
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
    allow_resize = true,
    side = "left",
    width = 40,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
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
