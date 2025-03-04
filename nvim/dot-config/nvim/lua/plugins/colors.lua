return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
            vim.cmd [[
              highlight Normal guibg=none
              highlight NonText guibg=none
              highlight Normal ctermbg=none
              highlight NonText ctermbg=none
            ]]
        end,
    }
}
