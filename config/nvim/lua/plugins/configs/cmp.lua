local present1, cmp = pcall(require, "cmp")
local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not (present1 or present2) then
   return
end

vim.opt.completeopt = "menuone,noselect"

local lspkind = require("lspkind")

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())

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
         vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

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
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replac,
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
   },
}
