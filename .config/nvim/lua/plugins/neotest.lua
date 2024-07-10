return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          })
        }
      })
    end,
    keys = {
      { "<leader>jr", function() require("neotest").run.run() end, desc = "Run nearest test (Neotest)" },
      { "<leader>jf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file (Neotest)" },
      { "<leader>jq", function() require("neotest").run.stop() end, desc = "Stop nearest test (Neotest)" },
      { "<leader>js", function() require("neotest").summary.toggle() end, desc = "Toggle summary (Neotest)" },
      { "<leader>jp", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel (Neotest)" },
    }
  },
}
