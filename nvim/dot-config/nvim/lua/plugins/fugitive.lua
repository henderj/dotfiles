return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    { "<leader>gp", "<cmd>G push<cr>", desc = "Git push" },
    { "<leader>gu", "<cmd>G pull<cr>", desc = "Git pull" },
    { "<leader>gf", "<cmd>G fetch<cr>", desc = "Git fetch" },
  }
}
