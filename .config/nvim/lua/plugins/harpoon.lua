return {
	'ThePrimeagen/harpoon',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	keys = {
		{ '<leader>a', function() require('harpoon.mark').add_file() end, desc = "Add file (Harpoon)" },
		{ '<C-e>', function() require('harpoon.ui').toggle_quick_menu() end, desc = "Quick menu (Harpoon)" },
		{ '<C-h>', function() require('harpoon.ui').nav_file(1) end, desc = "File 1 (Harpoon)" },
		{ '<C-j>', function() require('harpoon.ui').nav_file(2) end, desc = "File 2 (Harpoon)" },
		{ '<C-k>', function() require('harpoon.ui').nav_file(3) end, desc = "File 3 (Harpoon)" },
		{ '<C-l>', function() require('harpoon.ui').nav_file(4) end, desc = "File 4 (Harpoon)" },
	},
}
