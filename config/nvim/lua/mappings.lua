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

-- Config
map("n", "<leader>ce", ":e $MYVIMRC<CR>")
map("n", "<leader>cs", ":source $MYVIMRC<CR>")
map("n", "<leader>pi", ":PackerInstall<CR>")
map("n", "<leader>pc", ":PackerClean<CR>")
map("n", "<leader>pu", ":PackerUpdate<CR>")

-- Quitting
map("n", "<C-q>", [[ :q<CR>]])
map("i", "<C-q>", [[ <esc>:q<CR>]])
map("v", "<C-q>", [[ <esc>:q<CR>]])

-- Telescope
map("n", "<Leader>gs", [[<Cmd> Git <CR>]], opt)
map("n", "<Leader>gb", [[<Cmd> Telescope git_branches <CR>]], opt)
map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>gcb", [[<Cmd> Telescope git_bcommits <CR>]], opt)
map("n", "<Space>f", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Space>g", [[<Cmd> Telescope live_grep <CR>]], opt)
map("n", "<Space>h", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Space>t", [[<Cmd>Telescope treesitter<CR>]], opt)
