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
      { "<leader>jr", function() require("neotest").run.run() end,                   desc = "Run nearest test (Neotest)" },
      { "<leader>jd", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test (Neotest)" },
      { "<leader>jf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file (Neotest)" },
      { "<leader>jq", function() require("neotest").run.stop() end,                  desc = "Stop nearest test (Neotest)" },
      { "<leader>js", function() require("neotest").summary.toggle() end,            desc = "Toggle summary (Neotest)" },
      { "<leader>jp", function() require("neotest").output_panel.toggle() end,       desc = "Toggle output panel (Neotest)" },
    }
  },
  {
      "nvim-neotest/neotest-jest",
      config = function ()
        vim.api.nvim_set_keymap("n", "<leader>jw", "<cmd>lua require('neotest').run.run({ jestCommand = 'npm test -- --watch' })<cr>", { desc = "Run all in watch mode (Neotest)"})
        vim.api.nvim_set_keymap("n", "<leader>ju", "<cmd>lua require('neotest').run.run({ jestCommand = 'npm test -- -u' })<cr>", { desc = "Update snapshot for current test (Neotest)"})
      end
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      auto_reload = true,
      summary = {
        min_coverage = 60.0
      }
    },
    keys = {
      { "<leader>jc", function() require("coverage").load(true) end, desc = "Load and show coverage" },
      { "<leader>jt", function() require("coverage").toggle() end, desc = "Toggle coverage" },
      { "<leader>je", function() require("coverage").summary() end, desc = "Show coverage summary" },
    }
  }
}
