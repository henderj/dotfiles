return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- FIX: don't use cd (it messes with other plugin build steps)
  build = "cd app && npm install && git restore .",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreview<cr>",     desc = 'Open Markdown Preview' },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = 'Close Markdown Preview' },
  },
}
