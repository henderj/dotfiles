return {
  'tpope/vim-abolish',
  lazy = false,
  config = function ()
    vim.cmd([[Abolish cosnt const]])
  end
}
