return {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = {
        strategies = {
            chat = {
                adapter = "ollama"
            },
            inline = {
                adapter = "ollama"
            }
        }
    },
    keys = {
        -- TODO: figure out key bindings
    }
}
