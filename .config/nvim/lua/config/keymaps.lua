local map = vim.keymap.set

map("n", "<leader>L", "<cmd>Lazy<cr>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("i", "jk", "<Esc>")

map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- local lsp buffer keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    map({"n", "x"}, "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end
})
