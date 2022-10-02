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

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", {silent = true})

-- Git
map("n", "<Leader>gs", [[<Cmd> Git <CR>]], opt)
map("n", "<Leader>gbl", [[<Cmd> Git blame <CR>]], opt)
map("n", "<Leader>gbr", [[<Cmd> GBrowse<CR>]], opt)
map("v", "<Leader>gbr", [[:'<,'>GBrowse<CR>]], opt)
map("n", "<Leader>gpl", [[<Cmd> Git pull <CR>]], opt)
map("n", "<Leader>gps", [[<Cmd> Git push <CR>]], opt)
map("n", "<Leader>gpf", [[<Cmd> Git push --force-with-lease<CR>]], opt)
map("n", "<Leader>gpp", [[<Cmd> Dispatch! git pp <CR>]], opt)
map("n", "<Leader>gpr", [[<Cmd> Dispatch! git p-r <CR>]], opt)
map("n", "<Leader>gpu", [[<Cmd> Dispatch! git pushu <CR>]], opt)
map("n", "<Leader>gcm", [[<Cmd> Dispatch! git checkout master <CR>]], opt)

-- Telescope
map("n", "<Leader>gb", [[<Cmd> Telescope git_branches <CR>]], opt)
map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>gcb", [[<Cmd> Telescope git_bcommits <CR>]], opt)
map("n", "<Space>f", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Space>g", [[<Cmd> Telescope live_grep <CR>]], opt)
map("n", "<Space>h", [[<Cmd> Telescope help_tags<CR>]], opt)
map("n", "<Space>t", [[<Cmd> Telescope treesitter<CR>]], opt)
map("n", "<Space>s", [[<Cmd> Telescope lsp_workspace_symbols<CR>]], opt)
map("n", "<Space>r", [[<Cmd> Telescope resume<CR>]], opt)
map("n", "<Space>m", [[<Cmd> Telescope gitmoji<CR>]], opt)

map("n", "<Leader>t", [[<Cmd> TestFile <CR>]], opt)
map("n", "<Leader>s", [[<Cmd> TestNearest <CR>]], opt)
map("n", "<Leader>d", [[<Cmd> Dispatch <CR>]], opt)

-- NeoTest
map("n", "<Leader>nt", [[<Cmd> lua require("neotest").run.run(vim.fn.expand("%")) <CR>]], opt)
map("n", "<Leader>nc", [[<Cmd> lua require("neotest").run.run() <CR>]], opt)
map("n", "<Leader>na", [[<Cmd> lua require("neotest").run.run(vim.fn.getcwd()) <CR>]], opt)
map("n", "<Leader>nd", [[<Cmd> lua require("neotest").run.run({, strategy = "dap"}) <CR>]], opt)
map("n", "<Leader>ns", [[<Cmd> lua require("neotest").run.stop() <CR>]], opt)
map("n", "<Leader>no", [[<Cmd> lua require("neotest").output.open({ enter = true }) <CR>]], opt)
map("n", "<Leader>nna", [[<Cmd> lua require("neotest").run.attach() <CR>]], opt)

-- Trouble

map("n", "]t", [[<Cmd> lua require("trouble").next({skip_groups = true, jump = true})<CR>]])
map("n", "[t", [[<Cmd> lua require("trouble").previous({skip_groups = true, jump = true})<CR>]])

map("n", "ga", [[<Plug>(EasyAlign)]], opt)
map("x", "ga", [[<Plug>(EasyAlign)]], opt)

map("n", "<Leader>e", [[<cmd>0r !gitmoji-selector<CR>]])
