local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    "hrsh7th/cmp-nvim-lsp",
  }
}

function M.config()
  require("mason")

  function on_attach(client, bufnr)
    require("lsp_signature").on_attach({ bind = true, handler_opts = { border = "rounded" } }, bufnr)
    require("nvim-navic").attach(client, bufnr)

    -- Mappings.
    local opts = { noremap = true, silent = true, buffer = bufnr }

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

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_augroup("lsp_document_highlight", {
        clear = false
      })
      vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = "lsp_document_highlight",
      })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = "lsp_document_highlight",
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = "lsp_document_highlight",
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.vuels.setup({
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

  lspconfig.sumneko_lua.setup({
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

  lspconfig.elixirls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      elixirLS = {
        dialyzerEnabled = true,
        enableTestLenses = true
      }
    }
  })

  lspconfig.solargraph.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      solargraph = {
        -- commandPath = vim.env.HOME .. "/.asdf/shims/solargraph",
        diagnostics = true,
        formatting = true,
        -- useBundler = true,
      }
    }
  })

  lspconfig.coffeesense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  for _, server in ipairs {
    "ansiblels",
    "bashls",
    "cmake",
    "cssls",
    "dockerls",
    "eslint",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "sqlls",
    "terraformls",
    "tsserver",
    "yamlls",
  } do
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

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
end

return M
