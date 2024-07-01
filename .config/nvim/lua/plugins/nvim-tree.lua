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
  config = function()
    require("nvim-tree").setup {
      sync_root_with_cwd = true,
      renderer = {
        icons = {
          git_placement = "after"
        }
      },
      diagnostics = {
        enable = true
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      }
    }
  end
}
