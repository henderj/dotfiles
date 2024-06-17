return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { "<leader>gs", vim.cmd.Git },
    { "<leader>gp", "<cmd>G push<cr>" }
  }
}
