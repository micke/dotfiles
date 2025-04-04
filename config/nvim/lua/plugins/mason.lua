local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  }
}

M.tools = {
}

function M.check()
  local mr = require("mason-registry")
  for _, tool in ipairs(M.tools) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

function M.config()
  require("mason").setup()
  M.check()
  require("mason-lspconfig").setup({
    automatic_installation = {
      exclude = {
        "solargraph",
        "ruby_lsp",
      },
    },
  })
end

return M
