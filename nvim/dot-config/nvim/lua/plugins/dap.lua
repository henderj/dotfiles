return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            { '<F5>',       function() require('dap').continue() end,                                             desc = 'Continue (DAP)' },
            { '<F10>',      function() require('dap').step_over() end,                                            desc = 'Step over (DAP)' },
            { '<F11>',      function() require('dap').step_into() end,                                            desc = 'Step into (DAP)' },
            { '<F12>',      function() require('dap').step_out() end,                                             desc = 'Step out (DAP)' },
            { '<leader>db', function() require('dap').toggle_breakpoint() end,                                    desc = 'Toggle breakpoint (DAP)' },
            { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Set conditional breakpoint (DAP)' },
        },
        config = function()
            local dap = require('dap')
            local js_based_languages = { "javascript", "typescript" }

            for _, language in ipairs(js_based_languages) do
                dap.configurations[language] = {
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Launch file',
                        program = '${file}',
                        cwd = '${workspaceFolder}'
                    },
                    {
                        type = 'pwa-node',
                        request = 'attach',
                        name = 'Attach',
                        processId = require('dap.utils').pick_process,
                        cwd = '${workspaceFolder}'
                    }
                }
            end

            dap.configurations.go = {
                {
                    type = 'delve',
                    request = "launch",
                    name = 'Launch File',
                }
            }
        end
    },
    {
        'mxsdev/nvim-dap-vscode-js',
        dependencies = {
            'mfussenegger/nvim-dap',
            {
                'microsoft/vscode-js-debug',
                lazy = true,
                build =
                'rm -rf out && npm install --legacy-peer-deps && git restore . && npx gulp vsDebugServerBundle && mv dist out'
            }
        },
        opts = {
            debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
            adapters = { 'pwa-node', 'node-terminal', 'node' },
        }
    },
    {
        'leoluz/nvim-dap-go',
        config = true,
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = {
            'mfussenegger/nvim-dap'
        },
        ft = 'python',
        config = function()
            require('dap-python').setup("python")
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        keys = {
            { '<leader>du', function() require('dapui').toggle() end, desc = 'Toggle UI (DAP)' }
        },
        config = function()
            require('dapui').setup()
            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

            local dap, dapui = require('dap'), require('dapui')

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close({})
            end
        end
    }
}
