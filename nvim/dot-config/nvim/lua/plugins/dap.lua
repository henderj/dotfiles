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
        init = function()
            vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        end,
    },
    {
        'leoluz/nvim-dap-go',
        ft = 'go',
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
