local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

local Copilot = {
  init = false,
  status = "",
}

Copilot.setup = function ()
  local api = require("copilot.api")
  api.register_status_notification_handler(function(data)
    if data.status == "Normal" then
      status = ""
    elseif data.status == "InProgress" then
      status = "  "
    else
      status = data.status or "Offline"
    end
  end)
end

Copilot.get_status = function ()
  if not Copilot.init then
    Copilot.setup()
    Copilot.init = true
  end

  return status
end

function M.config()
  require("lualine").setup {
    options = {
      theme = "catppuccin",
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 1
        }
      },
      lualine_x = {Copilot.get_status, "encoding", "filetype"},
    },
  }
end

return M
