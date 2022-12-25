local M = {}

M.blankline = function()
  require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
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
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
      "class",
      "^func",
      "method",
      "^if",
      "while",
      "for",
      "with",
      "try",
      "except",
      "arguments",
      "argument_list",
      "object",
      "dictionary",
      "element",
      "table",
      "tuple",
      "do_block",
      "block_mapping_pair"
    },
    context_char_list = { "▎" },
  }
end

M.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

      -- Available modes: foreground, background
      mode = "background", -- Set the display mode.
    })
    vim.cmd "ColorizerReloadAllBuffers"
  end
end

M.comment = function()
  local present, nvim_comment = pcall(require, "nvim_comment")
  if present then
    nvim_comment.setup()
  end
end

M.luasnip = function()
  local present, luasnip = pcall(require, "luasnip")
  if not present then
    return
  end

  luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }
  require("luasnip/loaders/from_vscode").load()
end

M.neoscroll = function()
  pcall(function()
    require("neoscroll").setup()
  end)
end

M.signature = function()
  local present, lspsignature = pcall(require, "lsp_signature")
  if present then
    lspsignature.setup {
      bind = true,
      doc_lines = 0,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      hint_prefix = " ",
      hint_scheme = "String",
      hi_parameter = "Search",
      max_height = 22,
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
          border = "single", -- double, single, shadow, none
        },
        zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
        padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
    }
  end
end

return M
