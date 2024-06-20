return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  requires = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    { '<leader>tf', function() require('telescope.builtin').find_files() end },
    { '<leader>tg', function() require('telescope.builtin').git_files() end },
    { '<leader>tb', function() require('telescope.builtin').git_branches() end },
    { '<leader>tr', function() require('telescope.builtin').resume() end },
    { '<leader>tt', '<cmd>Telescope<cr>' },
    { '<leader>ts', function()
      require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
    end },
  },
}
