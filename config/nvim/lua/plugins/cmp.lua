local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "andersevenrud/cmp-tmux",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim",
  }
}

M.config = function()
  local cmp = require("cmp")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  vim.opt.completeopt = "menuone,noselect"

  local lspkind = require("lspkind")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  cmp.setup {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

        return vim_item
      end
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end
        },
      },
      { name = "path" },
      { name = "tmux" }
    },
  }
end

return M
