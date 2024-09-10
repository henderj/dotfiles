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
  opts = {
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
    },
    filters = {
      git_ignored = false,
    },
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.del('n', '<C-e>', { buffer = bufnr })
    end,
  }
}
