return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  lazy = false,
  keys = {
    { '<leader>et', function() require('nvim-tree.api').tree.toggle({ find_file = true }) end, desc = "Toggle nvim-tree" },
    { '<leader>ef', function() require('nvim-tree.api').tree.focus({ find_file = true }) end, desc = "Focus nvim-tree" },
    { '<leader>er',  '<cmd>NvimTreeRefresh<cr>', desc = "Refresh nvim-tree" },
  },
  config = true
}
