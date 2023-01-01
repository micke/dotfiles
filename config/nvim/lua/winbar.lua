local M = {}

local colors = require("nightfox.palette").load("hybridfox")
local navic = require "nvim-navic"

vim.api.nvim_set_hl(0, "WinBarSeparator",         { fg = colors.fg3 })
vim.api.nvim_set_hl(0, "WinBarFilename",          { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "WinBarContext",           { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsFile",          { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsModule",        { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsPackage",       { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsClass",         { bg = colors.fg3, fg = colors.yellow.base })
vim.api.nvim_set_hl(0, "NavicIconsMethod",        { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsProperty",      { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsField",         { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsEnum",          { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsInterface",     { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsFunction",      { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsVariable",      { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsConstant",      { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsString",        { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsNumber",        { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsArray",         { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsObject",        { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsKey",           { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsNull",          { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsStruct",        { bg = colors.fg3, fg = colors.yellow.base })
vim.api.nvim_set_hl(0, "NavicIconsEvent",         { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsOperator",      { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicText",               { bg = colors.fg3, fg = colors.blue.base })
vim.api.nvim_set_hl(0, "NavicSeparator",          { bg = colors.fg3, fg = colors.blue.base })

M.winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "fugitive",
}

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    vim.opt_local.winbar = nil
    return true
  end

  return false
end

local function get_modified()
  if vim.api.nvim_buf_get_option(0, "mod") then
    local mod = ""
    return "%#WinBarFilename# " .. mod .. " " .. "%t" .. " %*"
  end

  return "%#WinBarFilename# " .. "%f" .. " %*"
end

local function get_location()
  local location = navic.get_location()
  if location ~= nil and location ~= '' then
    return "%#WinBarContext#" .. " " .. location .. "%#WinBarFilename# %*"
  end

  return ""
end

function M.get_winbar()
  if excludes() then
    return ""
  end
  if navic.is_available() then
    return "%#WinBarSeparator#"
      .. "%*"
      .. get_modified()
      .. get_location()
      .. "%<%#WinBarSeparator#"
      .. ""
      .. "%*"
  else
    return "%#WinBarSeparator#"
      .. "%*"
      .. get_modified()
      .. "%#WinBarSeparator#"
      .. ""
      .. "%*"
  end
end

return M
