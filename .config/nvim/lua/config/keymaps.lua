local map = vim.keymap.set

map("n", "<leader>L", "<cmd>Lazy<cr>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("i", "jk", "<Esc>")

map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
