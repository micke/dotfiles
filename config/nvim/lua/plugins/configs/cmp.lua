local present, cmp = pcall(require, "cmp")

if not present then
   return
end

vim.opt.completeopt = "menuone,noselect"

local lspkind = require("lspkind")

-- nvim-cmp setup
cmp.setup {
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
--       format = function(entry, vim_item)
--          -- load lspkind icons
--          vim_item.kind = string.format(
--             "%s %s",
--             require("plugins.configs.lspkind_icons").icons[vim_item.kind],
--             vim_item.kind
--          )
-- 
--          vim_item.menu = ({
--             nvim_lsp = "[LSP]",
--             nvim_lua = "[Lua]",
--             buffer = "[BUF]",
--          })[entry.source.name]
-- 
--          return vim_item
--       end,
      format = function(entry, vim_item)
         vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

         vim_item.menu = ({
            buffer = "[buffer]",
            nvim_lsp = "[LSP]",
            tmux = "[tmux]",
            vsnip = "[snippet]",
         })[entry.source.name]
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
      -- ["<CR>"] = cmp.mapping.confirm {
      --    behavior = cmp.ConfirmBehavior.Replace,
      --    select = true,
      -- },
      ["<Tab>"] = function(fallback)
         if require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      {
         name = "buffer",
         opts = {
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
      { name = "tmux" },
   },
}
