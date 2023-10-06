local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  opts = {
    indent = { char = "▏" },
    exclude = {
      filetypes = {
        "help",
        "terminal",
        "dashboard",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "",
      },
      buftypes = {
        "terminal",
        "nofile"
      }
    },
    scope = {
      char = { "▎" },
      show_end = false,
      include = {
        node_type = {
          ["*"] = {
            "*"
          },
        },
      },
    },
  },
}

return M
