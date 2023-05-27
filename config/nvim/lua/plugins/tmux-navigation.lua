return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
  config = function()
    local navigation = require"nvim-tmux-navigation"

    navigation.setup {
      disable_when_zoomed = true,
    }

    vim.keymap.set({ "n", "c" }, "<c-h>", navigation.NvimTmuxNavigateLeft, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c" }, "<c-j>", navigation.NvimTmuxNavigateDown, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c" }, "<c-k>", navigation.NvimTmuxNavigateUp, { noremap = true, silent = true })
    vim.keymap.set({ "n", "c" }, "<c-l>", navigation.NvimTmuxNavigateRight, { noremap = true, silent = true })

    vim.keymap.set({ "i" }, "<c-h>", [[<C-o><cmd>NvimTmuxNavigateLeft<cr>]], { noremap = true, silent = true })
    vim.keymap.set({ "i" }, "<c-j>", [[<cmd>NvimTmuxNavigateDown<cr>]], { noremap = true, silent = true })
    vim.keymap.set({ "i" }, "<c-k>", [[<cmd>NvimTmuxNavigateUp<cr>]], { noremap = true, silent = true })
    vim.keymap.set({ "i" }, "<c-l>", [[<cmd>NvimTmuxNavigateRight<cr>]], { noremap = true, silent = true })
  end,
}
