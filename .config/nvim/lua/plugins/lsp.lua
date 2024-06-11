local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  })
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    require("mason-lspconfig").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {},
      handlers = {
        default_setup,
      },
    })

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
      },
      mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl-Space triggers completion menu
        ['<C-Space'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end,
}
