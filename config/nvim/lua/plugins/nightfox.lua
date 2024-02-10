return {
  "EdenEast/nightfox.nvim",
  enabled = false,
  dev = true,
  lazy = false,
  priority = 999,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require("nightfox").setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "bold"
        },
      },
      groups = {
        all = {
          ["@symbol"] = { link = "Identifier" },
          ["@text.literal"] = { style = "" },
        },
      },
    })

    local colors = require("nightfox.palette").load("hybridfox")

    -- WinBar/Navic

    vim.api.nvim_set_hl(0, "WinBarSeparator",         { fg = colors.base })
    vim.api.nvim_set_hl(0, "WinBarFilename",          { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "WinBarContext",           { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsFile",          { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsModule",        { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsNamespace",     { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsPackage",       { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsClass",         { bg = colors.base, fg = colors.yellow.base })
    vim.api.nvim_set_hl(0, "NavicIconsMethod",        { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsProperty",      { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsField",         { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsConstructor",   { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsEnum",          { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsInterface",     { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsFunction",      { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsVariable",      { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsConstant",      { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsString",        { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsNumber",        { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsBoolean",       { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsArray",         { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsObject",        { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsKey",           { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsNull",          { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsStruct",        { bg = colors.base, fg = colors.yellow.base })
    vim.api.nvim_set_hl(0, "NavicIconsEvent",         { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsOperator",      { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicText",               { bg = colors.base, fg = colors.blue.base })
    vim.api.nvim_set_hl(0, "NavicSeparator",          { bg = colors.base, fg = colors.blue.base })

    vim.cmd("colorscheme hybridfox")
  end,
}
