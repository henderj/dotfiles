return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    { "<leader>gp", "<cmd>G push<cr>", desc = "Git push" }
  }
}
