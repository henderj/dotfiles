return {
  'nvimdev/lspsaga.nvim',
  opts = {
    lightbulb = {
      virtual_text = false
    },
    rename = {
      in_select = false
    }
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  }
}
