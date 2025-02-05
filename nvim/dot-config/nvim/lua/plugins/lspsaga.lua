return {
    'nvimdev/lspsaga.nvim',
    opts = {
        lightbulb = {
            enable = false
        },
        rename = {
            in_select = false
        }
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
