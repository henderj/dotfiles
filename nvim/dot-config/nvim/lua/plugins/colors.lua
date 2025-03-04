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
            require("catppuccin").setup({
                transparent_background = true,
                term_colors = true,
                integrations = {
                    avante = true,
                    cmp = true,
                    fzf = true,
                    harpoon = true,
                    illuminate = true,
                    lsp_saga = true,
                    lsp_trouble = true,
                    mason = true,
                    nvimtree = true,
                    noice = true,
                    nvim_surround = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                    which_key = true,
                }
            })
            vim.cmd([[colorscheme catppuccin]])
        end,
    }
}
