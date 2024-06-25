return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    { '<leader>tf', function() require('telescope.builtin').find_files() end, desc = 'Find files (Telescope)' },
    { '<leader>tg', function() require('telescope.builtin').git_files() end, desc = 'Git files (Telescope)' },
    { '<leader>tb', function() require('telescope.builtin').git_branches() end, desc = 'Git branches (Telescope)' },
    { '<leader>tr', function() require('telescope.builtin').resume() end, desc = 'Resume (Telescope)' },
    { '<leader>tl', function() require('telescope.builtin').live_grep() end, desc = 'Live grep (Telescope)' },
    { '<leader>tt', '<cmd>Telescope<cr>', desc = 'Telescope' },
    { '<leader>ts', function()
      require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
    end, desc = 'Grep (Telescope)' },
  },
}
