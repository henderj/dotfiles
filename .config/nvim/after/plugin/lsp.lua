local lsp = require("lsp-zero")

lsp.preset("recommended")


local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = {
    }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	lsp.default_keymaps({buffer = bufnr})

	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'lua_ls',
		'rust_analyzer',
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

        lua_ls = function ()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                }
            })
        end
	},
})

lsp.setup()
