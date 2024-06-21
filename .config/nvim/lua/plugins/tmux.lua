return {
  "christoomey/vim-tmux-navigator",
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<M-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Left pane" },
    { "<M-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Down pane" },
    { "<M-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Up pane" },
    { "<M-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Right pane" },
    { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Previous pane" },
  },
}
