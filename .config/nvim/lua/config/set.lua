vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.cursorline = true

vim.g.markdown_folding = 1

vim.opt.splitright = true
vim.opt.splitbelow = true

-- For large files (>10k lines), disable foldmethod=expr, use foldmethod=indent
-- vim.cmd([[
--   autocmd BufReadPost * if line('$') > 10000 | setlocal foldmethod=indent | endif
-- ]])

-- For long lines
vim.opt.synmaxcol=200

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = 'eob: ,fold: ,foldopen:,foldsep:│,foldclose:'
