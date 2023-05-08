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
      },
    })
  end,
}
