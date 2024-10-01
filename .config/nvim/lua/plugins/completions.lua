return {
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "v2.*",
    build = "make install_jsregexp"
  },
  {
    "hrsh7th/nvim-cmp",
    event = { 'InsertEnter', 'CmdlineEnter' },
    lazy = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')
      require("luasnip.loaders.from_snipmate").lazy_load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'lazydev', group_index = 0}
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-e>'] = cmp.mapping.close(),
          ['<C-CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true
                })
              end
            else
              fallback()
            end
          end),

          -- Ctrl-space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        formatting = {
          format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
        }
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = true,
  },
}
