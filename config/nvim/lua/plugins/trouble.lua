return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "]t", [[<Cmd> lua require("trouble").next({skip_groups = true, jump = true})<CR>]] },
    { "[t", [[<Cmd> lua require("trouble").previous({skip_groups = true, jump = true})<CR>]] },
  },
  config = {
    mode = {
      "lsp_workspace_diagnostics",
      "lsp_workspace_diagnostics",
      "lsp_document_diagnostics",
      "quickfix",
      "lsp_references",
      "loclist",
    },
    use_diagnostic_signs = true,
  }
}
