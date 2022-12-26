return {
  "nvim-neotest/neotest",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
    "haydenmeade/neotest-jest",
  },
  keys = {
    { "<Leader>nt", [[<Cmd> lua require("neotest").run.run(vim.fn.expand("%")) <CR>]] },
    { "<Leader>nc", [[<Cmd> lua require("neotest").run.run() <CR>]] },
    { "<Leader>na", [[<Cmd> lua require("neotest").run.run(vim.fn.getcwd()) <CR>]] },
    { "<Leader>nd", [[<Cmd> lua require("neotest").run.run({, strategy = "dap"}) <CR>]] },
    { "<Leader>ns", [[<Cmd> lua require("neotest").run.stop() <CR>]] },
    { "<Leader>no", [[<Cmd> lua require("neotest").output.open({ enter = true }) <CR>]] },
    { "<Leader>nna", [[<Cmd> lua require("neotest").run.attach() <CR>]] },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
        require("neotest-jest"),
      },
      icons = {
        running_animated = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"},
        passed = "",
        running = "",
        failed = "",
        skipped = "",
        unknown = "",
      }
    })
  end,
}
