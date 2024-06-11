local servers = {
  "lua_ls",
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- vim.diagnostic.config({...})

      local lspconfig = require("lspconfig")

      -- local signs = { ... }

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        local map = vim.keymap.set
        map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        map({ "n", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = "LSP action",
        callback = on_attach,
      })

      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        handlers = {
          default_setup,
          lua_ls = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT'
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    library = {
                      vim.env.VIMRUNTIME,
                    }
                  },
                },
              },
            })
          end,
        },
      })
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),

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

          -- Ctrl-space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end,
  },
}
