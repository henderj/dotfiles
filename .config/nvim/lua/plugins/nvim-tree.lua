return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  lazy = false,
  keys = {
    { '<leader>et', function() require('nvim-tree.api').tree.toggle({ find_file = true }) end },
    { '<leader>ef', '<cmd>NvimTreeFocus<cr>' },
    { '<leader>er',  '<cmd>NvimTreeRefresh<cr>' },
  },
  config = true
}
