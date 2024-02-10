return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 999,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local colors = require("catppuccin.palettes").get_palette()

    require("catppuccin").setup {
      flavour = "macchiato",
      integrations = {
        navic = {
          enabled = true,
          custom_bg = colors.surface1,
        },
      },
      custom_highlights = function(C)
        local U = require("catppuccin.utils.colors")
        local winBarBackground = C.surface1
        local brightenFgPair = function(bg, percentage)
          percentage = percentage or 0.8
          return { fg = U.brighten(bg, percentage), bg = bg }
        end

        return {
          WinBarSeparator = { fg = winBarBackground },
          WinBarFilename = { bg = winBarBackground, fg = C.teal },
          WinBarContext = { bg = winBarBackground, fg = C.blue },

          Pmenu = { fg = C.overlay2, bg = C.surface1 },
          PmenuSel = { fg = C.text, bg = C.surface0 },

          CmpItemMenu = { fg = C.pink, bg = "NONE", style = { "italic" } },

          CmpItemKindField = brightenFgPair(C.red),
          CmpItemKindProperty = brightenFgPair(C.red),
          CmpItemKindEvent = brightenFgPair(C.red),

          CmpItemKindText = brightenFgPair(C.green),
          CmpItemKindEnum = brightenFgPair(C.green),
          CmpItemKindKeyword = brightenFgPair(C.green),

          CmpItemKindConstant = brightenFgPair(C.yellow),
          CmpItemKindConstructor = brightenFgPair(C.yellow),
          CmpItemKindReference = brightenFgPair(C.yellow),

          CmpItemKindFunction = brightenFgPair(C.mauve),
          CmpItemKindStruct = brightenFgPair(C.mauve),
          CmpItemKindClass = brightenFgPair(C.mauve),
          CmpItemKindModule = brightenFgPair(C.mauve),
          CmpItemKindOperator = brightenFgPair(C.mauve),

          CmpItemKindVariable = brightenFgPair(C.rosewater),
          CmpItemKindFile = brightenFgPair(C.rosewater),

          CmpItemKindUnit = brightenFgPair(C.peach),
          CmpItemKindSnippet = brightenFgPair(C.peach),
          CmpItemKindFolder = brightenFgPair(C.peach),

          CmpItemKindMethod = brightenFgPair(C.blue),
          CmpItemKindValue = brightenFgPair(C.blue),
          CmpItemKindEnumMember = brightenFgPair(C.blue),

          CmpItemKindInterface = brightenFgPair(C.teal),
          CmpItemKindColor = brightenFgPair(C.teal),
          CmpItemKindTypeParameter = brightenFgPair(C.teal),
        }
      end,
    }

    vim.cmd.colorscheme "catppuccin"
  end,
}
