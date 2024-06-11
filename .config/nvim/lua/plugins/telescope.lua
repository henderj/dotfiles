return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  requires = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>pf', function() require('telescope.builtin').find_files() end },
    { '<C-p>', function() require('telescope.builtin').git_files() end },
    { '<leader>ps', function() 
      require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) 
    end },
  },
}
