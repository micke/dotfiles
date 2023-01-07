local set = vim.keymap.set

set("n", "yae", [[ <cmd>%y+<cr>]], { desc = "yank everything" })
set("n", "vae", [[ ggVG]], { desc = "visual everything" })
set("n", "dae", [[ ggdG]], { desc = "delete everything" })
set("n", "Y", [[y$]], { desc = "yank till end" })

set("n", "<leader>i", [[<cmd Inspect<cr>]], { desc = "Inspect highlighting" })

set("n", "<leader>pu", function() require("lazy").sync() end)
set("", "<C-q>", [[<cmd> q<cr>]], { desc = "Quit" })
