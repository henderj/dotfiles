return {
  "folke/which-key.nvim",
  -- enabled = false,
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      expand = 1,
    })

    wk.add({
      { "<leader>g", group = "git", icon = "󰊢" },
      { "<leader>e", group = "nvim-tree", icon = "" },
      { "<leader>L", desc = "Lazy", icon = "󰒲 " },
      { "<leader>s", desc = "Replace word" },
      { "<leader>j", group = "Neotest", icon = "󰙨" },
      { "<leader>t", group = "Telescope" },
      { "<leader>m", group = "Markdown", icon = "" },
      { "<leader>x", group = "Trouble", icon = "󰔫" },
      { "<leader>c", group = "Code", icon = "" },
      { "<leader>y", desc = "yank to clipboard" },
      { "<leader>Y", desc = "Yank to clipboard" },
      { "<leader>p", desc = "put from clipboard" },
      { "<leader>P", desc = "Put from clipboard" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer local keymaps (which-key)",
    },
  },
}
