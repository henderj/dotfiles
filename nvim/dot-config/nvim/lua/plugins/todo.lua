return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
    { "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
  }
}

-- PERF: fully optimized
-- HACK: hmmm, this looks a bit funky
-- TODO: what else?
-- NOTE: adding a note
-- FIX: this needs fixing
-- WARN: ???
-- TEST: test something
