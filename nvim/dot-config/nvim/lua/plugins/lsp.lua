local servers = {
    "lua_ls",
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "jsonls",
    "marksman",
    "clangd"
}

return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "nvimdev/lspsaga.nvim"
        },
        config = function()
            local lspconfig = require("lspconfig")

            local signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.INFO] = '',
                    [vim.diagnostic.severity.HINT] = '',
                }
            }

            vim.diagnostic.config({
                signs = signs
            })

            local on_attach = function(args)
                local map = vim.keymap.set
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr, desc = "Hover" })
                map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr, desc = "Go to definition" })
                map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { buffer = bufnr, desc = "Go to declaration" })
                map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",
                    { buffer = bufnr, desc = "Go to implementation" })
                map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>",
                    { buffer = bufnr, desc = "Go to type definition" })
                map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { buffer = bufnr, desc = "View references" })
                map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, desc = "Signature help" })
                map("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { buffer = bufnr, desc = "Rename" })
                map({ "n", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
                    { buffer = bufnr, desc = "Format code" })
                map('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                    { buffer = bufnr, desc = "Signature help" })
                -- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr, desc = "Code action" })

                if client and client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format { async = false, bufnr = bufnr, id = args.data.client_id }
                        end,
                    })
                end
            end

            vim.lsp.inlay_hint.enable(true)

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = "LSP action",
                callback = on_attach,
            })

            local load_capabilities = function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
                return capabilities
            end

            local default_setup = function(server)
                require('lspconfig')[server].setup({
                    capabilities = load_capabilities(),
                })
            end

            require("mason").setup({})
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = servers,
                handlers = {
                    default_setup,
                    lua_ls = function()
                        lspconfig.lua_ls.setup({
                            capabilities = load_capabilities(),
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
                    ts_ls = function()
                        lspconfig.ts_ls.setup({
                            capabilities = load_capabilities(),
                            init_options = {
                                plugins = {
                                    {
                                        name = '@vue/typescript-plugin',
                                        location = require('mason-registry').get_package('vue-language-server')
                                            :get_install_path() ..
                                            '/node_modules/@vue/language-server',
                                        languages = { 'vue' },
                                    },
                                },
                            },
                            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                        })
                    end,
                    volar = function()
                        lspconfig.volar.setup({})
                    end,
                    pyright = function()
                        lspconfig.pyright.setup({
                            capabilities = load_capabilities(),
                        })
                    end,
                    html = function()
                        lspconfig.html.setup({
                            capabilities = load_capabilities(),
                            filetypes = { 'html', 'gotmpl' },
                        })
                    end,
                    gopls = function()
                        lspconfig.gopls.setup({
                            capabilities = load_capabilities(),
                            settings = {
                                gopls = {
                                    gofumpt = true,
                                    staticcheck = true,
                                    vulncheck = "Imports",
                                    hints = {
                                        parameterNames = true,
                                    }
                                }
                            }
                        })
                    end,
                    pylsp = function()
                        lspconfig.pylsp.setup({
                            capabilities = load_capabilities(),
                            settings = {
                                pylsp = {
                                    plugins = {
                                        pycodestyle = {
                                            maxLineLength = 120,
                                        },
                                    },
                                },
                            },
                        })
                    end
                },
            })
        end
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
        lazy = true,
    },
    {
        "icholy/lsplinks.nvim",
        config = true,
        keys = {
            { "gx", function() require("lsplinks").gx() end, desc = "Open link" }
        }
    },
    {
        "aznhe21/actions-preview.nvim",
        keys = {
            { "<leader>ca", function() require("actions-preview").code_actions() end, mode = { "n", "v" }, desc = "Code actions" }
        }
    }
}
