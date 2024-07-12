return {
  "folke/ts-comments.nvim",
  opts = {},
  event = { 'BufReadPre', 'BufNewFile' },
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}

-- return {
--   'numToStr/Comment.nvim',
--   config = true,
--   enabled = false, -- disable for now. I might use it later though
-- }
