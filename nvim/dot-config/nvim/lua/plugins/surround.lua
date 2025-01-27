return {
  'tpope/vim-surround',
  event = { 'BufReadPre', 'BufNewFile' },
  init = function()
    vim.g.surround_no_insert_mappings = true
  end
}
