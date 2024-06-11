return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	lazy = false,
	keys = {
		{ '<leader>t', '<cmd>NvimTreeToggle<cr>' },
	},
	config = function()
		require('nvim-tree').setup()
	end,
}
