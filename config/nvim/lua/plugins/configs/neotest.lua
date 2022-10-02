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
  },
})
