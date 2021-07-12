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
map("n", "<leader>pu", ":PackerSync<CR>")

-- Quitting
map("n", "<C-q>", [[ :q<CR>]])
map("i", "<C-q>", [[ <esc>:q<CR>]])
map("v", "<C-q>", [[ <esc>:q<CR>]])

-- Git
map("n", "<Leader>gs", [[<Cmd> Git <CR>]], opt)
map("n", "<Leader>gbl", [[<Cmd> Git blame <CR>]], opt)
map("n", "<Leader>gbr", [[<Cmd> Git browse <CR>]], opt)
map("n", "<Leader>gpl", [[<Cmd> Git pull <CR>]], opt)
map("n", "<Leader>gps", [[<Cmd> Git push <CR>]], opt)
map("n", "<Leader>gpf", [[<Cmd> Git push --force-with-lease<CR>]], opt)
map("n", "<Leader>gpp", [[<Cmd> Dispatch! git pp <CR>]], opt)
map("n", "<Leader>gpr", [[<Cmd> Dispatch! git p-r <CR>]], opt)
map("n", "<Leader>gpu", [[<Cmd> Dispatch! git pushu <CR>]], opt)

-- Telescope
map("n", "<Leader>gb", [[<Cmd> Telescope git_branches <CR>]], opt)
map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>gcb", [[<Cmd> Telescope git_bcommits <CR>]], opt)
map("n", "<Space>f", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Space>g", [[<Cmd> Telescope live_grep <CR>]], opt)
map("n", "<Space>h", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Space>t", [[<Cmd>Telescope treesitter<CR>]], opt)
