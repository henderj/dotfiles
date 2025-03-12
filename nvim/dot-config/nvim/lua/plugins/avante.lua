return {
    "yetone/avante.nvim",
    cmd = 'AvanteAsk',
    opts = {
        provider = "ollama",
        ollama = {
            endpoint = "http://127.0.0.1:11434",
            model = "qwq:32b",
            -- model = "deepseek-coder:6.7b",
            -- model = "stable-code",
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    },
}
