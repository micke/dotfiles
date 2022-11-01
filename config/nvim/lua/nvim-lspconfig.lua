function on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  require"lsp_signature".on_attach()

  -- Mappings.
  local opts = {noremap = true, silent = true, buffer = bufnr}

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  -- vim.keymap.set("n", "[d", vim.lsp.diagnostic.goto_prev, opts)
  -- vim.keymap.set("n", "]d", vim.lsp.diagnostic.goto_next, opts)
  -- vim.keymap.set("n", "<space>q", vim.lsp.diagnostic.set_loclist, opts)

  -- print(vim.inspect(client.server_capabilities))

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  elseif client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.range_formatting, opts)
  end

  if client.server_capabilities.documentSymbolProvider then
    local navic = require "nvim-navic"
    navic.attach(client, bufnr)
  end

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
      ]], false)
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  if server.name == "vuels" then
    server:setup({
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        config = {
          vetur = {
            completion = {
              autoImport = true,
            },
            format = {
              enable = true,
              defaultFormatter = {
                js = "prettier-eslint",
                ts = "prettier-eslint",
              },
            },
            validation = {
              script = false,
              style = true,
              template = true,
            },
          }
        }
      }
    })
  elseif server.name == "sumneko_lua" then
    server:setup({
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = function()
        return vim.loop.cwd()
      end,
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
            }
          },
          telemetry = {
            enable = false
          }
        }
      }
    })
  elseif server.name == "elixirls" then
    server:setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        elixirLS = {
          dialyzerEnabled = true,
          enableTestLenses = true
        }
      }
    })
  elseif server.name == "solargraph" then
    server:setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        solargraph = {
          formatting = true,
        }
      }
    })
  else
    server:setup({
      on_attach = on_attach,
      capabilities = capabilities,
      -- root_dir = vim.loop.cwd
    })
  end

  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
   vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefault" .. name })
end

lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warning", "")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "single",
})

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
