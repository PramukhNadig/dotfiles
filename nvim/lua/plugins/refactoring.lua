return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    -- extract operations (visual mode)
    {
      "<leader>re",
      function() require("refactoring").refactor("Extract Function") end,
      mode = "v",
      desc = "Extract function",
    },
    {
      "<leader>rv",
      function() require("refactoring").refactor("Extract Variable") end,
      mode = "v",
      desc = "Extract variable",
    },
    -- inline operations (normal mode)
    {
      "<leader>ri",
      function() require("refactoring").refactor("Inline Variable") end,
      mode = { "n", "v" },
      desc = "Inline variable",
    },
    {
      "<leader>rI",
      function() require("refactoring").refactor("Inline Function") end,
      desc = "Inline function",
    },
    -- print statements for debugging
    {
      "<leader>rp",
      function() require("refactoring").debug.print_var() end,
      mode = { "n", "v" },
      desc = "Debug: print var",
    },
    {
      "<leader>rc",
      function() require("refactoring").debug.cleanup({}) end,
      desc = "Debug: clean up print vars",
    },
  },
}
