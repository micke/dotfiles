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
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅙 ",
          [vim.diagnostic.severity.WARN] = "󰀦 ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
        },
      },
      jump = {
        float = true,
      },
    }
  },
}

function M.config(_, opts)
  require("mason")

  local kmopts = { noremap = true, silent = true }

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

  vim.lsp.config("vue_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  })
  vim.lsp.enable("vue_ls")

  vim.lsp.config("lua_ls", {
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
  vim.lsp.enable("lua_ls")

  vim.lsp.config("elixirls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      elixirLS = {
        dialyzerEnabled = true,
        enableTestLenses = true
      }
    }
  })
  vim.lsp.enable("elixirls")

  -- vim.lsp.config("solargraph", {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
  --     solargraph = {
  --       -- commandPath = vim.env.HOME .. "/.asdf/shims/solargraph",
  --       diagnostics = true,
  --       formatting = true,
  --       -- useBundler = true,
  --     }
  --   }
  -- })

  -- vim.lsp.config("rubocop", {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })

  vim.lsp.config("ruby_lsp", {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      enabledFeatures = {
        semanticHighlighting = false,
      },
    }
  })
  vim.lsp.enable("ruby_lsp")

  vim.lsp.config("coffeesense", {
    on_attach = on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable("coffeesense")

  vim.lsp.config("yamlls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        keyOrdering = false
      },
      redhat = { telemetry = { enabled = false } },
    },
  })
  vim.lsp.enable("yamlls")

  vim.lsp.config("terraformls", {
    on_attach = on_attach,
    capabilities = capabilities,
    -- init_options = {
    --   terraformls = {
    --     diagnostics = false,
    --   },
    --   diagnostics = false
    -- },
  })
  vim.lsp.enable("terraformls")

  vim.lsp.config("ts_ls", {
  })
  vim.lsp.enable("ts_ls")


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
  } do
    vim.lsp.config(server, {
      on_attach = on_attach,
      capabilities = capabilities,
    })
    vim.lsp.enable(server)
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
     border = "single",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
     border = "single",
  })
end

return M
