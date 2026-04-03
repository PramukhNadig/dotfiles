return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "fredrikaverpil/neotest-golang",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          python = ".venv/bin/python",
        },
        ["neotest-golang"] = {},
      },
    },
    keys = {
      { "<leader>tn", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Re-run last test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle test output" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop test" },
      {
        "[t",
        function() require("neotest").jump.prev({ status = "failed" }) end,
        desc = "Previous failed test",
      },
      {
        "]t",
        function() require("neotest").jump.next({ status = "failed" }) end,
        desc = "Next failed test",
      },
    },
  },
}
