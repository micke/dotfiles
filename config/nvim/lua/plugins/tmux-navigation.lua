return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
  config = function()
    local navigation = require"nvim-tmux-navigation"

    navigation.setup {
      disable_when_zoomed = true,
    }

    vim.keymap.set({ "n", "c", "i" }, "<c-h>", navigation.NvimTmuxNavigateLeft, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c", "i" }, "<c-j>", navigation.NvimTmuxNavigateDown, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c", "i" }, "<c-k>", navigation.NvimTmuxNavigateUp, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c", "i" }, "<c-l>", navigation.NvimTmuxNavigateRight, { noremap = true, silent = true })
  end,
}
