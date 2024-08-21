local map = vim.keymap.set

map("n", "<leader>L", "<cmd>Lazy<cr>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("i", "jk", "<Esc>")

map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

map("n", "J", "mzJ`z")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map({"n", "v"}, "<leader>p", [["+p]])
map({"n", "v"}, "<leader>P", [["+P]])

map({"n", "v"}, "<leader>y", [["+y]])
map({"n", "v"}, "<leader>Y", [["+Y]])

map("n", "<C-n>", "<cmd>cnext<cr>zz")
map("n", "<C-p>", "<cmd>cprev<cr>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map({"i", "c", "t"}, "<C-h>", "<C-w>", { silent = true })

map("n", "<leader>q", "<cmd>q<cr>")
