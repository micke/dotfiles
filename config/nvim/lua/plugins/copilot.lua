return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
      },
      filetypes = {
        yaml = true,
        haml = true,
        gitcommit = true,
        gitrebase = true,
      },
      server_opts_overrides = {
        settings = {
          advanced = {
            inlineSuggestCount = 5,
          },
        },
      },
    })
  end,
}
