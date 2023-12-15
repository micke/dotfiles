local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    diagnostics = {
      underline = true,
      virtual_text = false,
      update_in_insert = true,
      severity_sort = true,
    }
  },
}

function M.config(_, opts)
  require("mason")

  local kmopts = { noremap = true, silent = true }

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, kmopts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, kmopts)

  vim.diagnostic.config(opts.diagnostics)

  function on_attach(client, bufnr)
    require("lsp_signature").on_attach({ bind = true, handler_opts = { border = "rounded" } }, bufnr)
    require("nvim-navic").attach(client, bufnr)

    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
    -- vim.keymap.set("n", "<space>q", vim.lsp.diagnostic.set_loclist, kmopts)

    -- print(vim.inspect(client.server_capabilities))

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, kmopts)
    elseif client.server_capabilities.documentRangeFormattingProvider then
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.range_formatting, kmopts)
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
        callback = function() vim.lsp.buf.clear_references() end,
      })
    end
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  })

  lspconfig.lua_ls.setup({
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
        diagnostics = false,
        formatting = false,
        -- useBundler = true,
      }
    }
  })

  lspconfig.rubocop.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lspconfig.coffeesense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        keyOrdering = false
      },
      redhat = { telemetry = { enabled = false } },
    },
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
    "rnix",
    "sqlls",
    "terraformls",
    "tsserver",
  } do
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
     border = "single",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
     border = "single",
  })

  -- replace the default lsp diagnostic letters with prettier symbols
  local signs = { Error = "󰅙 ", Warn = "󰀦 ", Hint = "󰌵 ", Info = "󰋽 " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return M
