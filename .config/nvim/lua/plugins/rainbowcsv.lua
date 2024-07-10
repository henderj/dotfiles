return {
  'cameron-wags/rainbow_csv.nvim',
  ft = 'csv',
  init = function()
    vim.g.nvim_treesitter_ignore_install = { 'csv' }
  end,
  config = true
}
