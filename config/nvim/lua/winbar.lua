-- local winbar = {}
--
-- winbar.filetype_exclude = {
--     "fugitive"
-- }
--
-- local colors = require('nightfox.colors').init()
-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, "WinBarContent", { fg = colors.green, bg = colors.bg_statusline })
--
-- winbar.eval = function()
--     if vim.api.nvim_eval_statusline("%f",{})["str"] == "[No Name]" then
--         return ""
--     end
--
--     for _, ft in ipairs(winbar.filetype_exclude) do
--         if vim.bo.filetype == ft then
--             return ""
--         end
--     end
--
--     local cw = vim.api.nvim_get_current_win()
--     return "%#WinBarSeparator#"
--         .. ""
--         .. "%*"
--         .. "%#WinBarContent#"
--         .. cw
--         .. "%*"
--         .. "%#WinBarSeparator#"
--         .. ""
--         .. "%*"
-- end
--
-- return winbar
--
local M = {}

local colors = require("nightfox.palette").load("hybridfox")
local navic = require "nvim-navic"

vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.fg3 })
vim.api.nvim_set_hl(0, "WinBarFilename", { fg = colors.blue.base, bg = colors.fg3 })
vim.api.nvim_set_hl(0, "WinBarContext", { fg = colors.blue.base, bg = colors.fg3 })

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
    return "%#WinBarContext#" .. " " .. location .. " %*"
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
