function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- EVERYTHING --
map("n", "yae", [[ <Cmd> %y+<CR>]])
map("n", "vae", "ggVG")

map("n", "Y", "y$")
map("n", "<Leader>i", [[<Cmd> Inspect<CR>]])

-- Config
map("n", "<leader>ce", ":e $MYVIMRC<CR>")
map("n", "<leader>cs", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>pu", function()
  local packer = require("packer")
  local snapshotName = os.date("%Y-%m-%dT%T")
  packer.snapshot(snapshotName)
  print("Took packer snapshot with name: " .. snapshotName)
  packer.sync()
end)

-- Quitting
map("", "<C-q>", [[:q<CR>]])

-- TmuxNavigator
map("i", "<C-h>", [[<C-o>:TmuxNavigateLeft<CR>]])
map("i", "<C-j>", [[<C-o>:TmuxNavigateDown<CR>]])
map("i", "<C-k>", [[<C-o>:TmuxNavigateUp<CR>]])
map("i", "<C-l>", [[<C-o>:TmuxNavigateRight<CR>]])
-- map("c", "<C-h>", [[<C-o>:TmuxNavigateLeft<CR>]])
-- map("c", "<C-j>", [[<C-o>:TmuxNavigateDown<CR>]])
-- map("c", "<C-k>", [[<C-o>:TmuxNavigateUp<CR>]])
-- map("c", "<C-l>", [[<C-o>:TmuxNavigateRight<CR>]])

map("n", "<Leader>e", [[<cmd>0r !gitmoji-selector<CR>]])
