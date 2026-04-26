local set = vim.keymap.set

set("n", "yae", [[ <cmd>%y+<cr>]], { desc = "yank everything" })
set("n", "vae", [[ ggVG]], { desc = "visual everything" })
set("n", "dae", [[ ggdG]], { desc = "delete everything" })
set("n", "Y", [[y$]], { desc = "yank till end" })

set("n", "<leader>i", [[<cmd Inspect<cr>]], { desc = "Inspect highlighting" })

set("n", "<leader>pu", function() require("lazy").sync() end)
set("", "<C-q>", [[<cmd> q<cr>]], { desc = "Quit" })

set("n", "gf", function()
  -- Try the normal gf first
  local ok = pcall(vim.cmd, "normal! gf")

  if not ok then
    local file = vim.fn.expand("<cfile>")
    if file == "" then
      return
    end

    -- Resolve the file relative to current buffer directory
    local bufdir = vim.fn.expand("%:p:h")
    local target = vim.fn.resolve(bufdir .. "/" .. file)

    -- Ensure parent directories exist
    local targetdir = vim.fn.fnamemodify(target, ":h")
    if vim.fn.isdirectory(targetdir) == 0 then
      vim.fn.mkdir(targetdir, "p")
    end

    -- Open or create the file
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  end
end, { silent = true })
