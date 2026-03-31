return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "python3",
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
    },
    -- show problem description as a split, not a popup
    description = {
      position = "left",
      width = "40%",
    },
    keys = {
      toggle = { "q" },
      confirm = { "<CR>" },
      reset_testcases = "r",
      use_testcase = "U",
      focus_testcases = "<C-h>",
      focus_result = "<C-l>",
    },
    hooks = {
      ["enter"] = {},
      ["question_enter"] = {
        function()
          -- disable distracting UI for focus
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
          vim.opt_local.signcolumn = "no"
          -- auto-enter zen mode
          vim.defer_fn(function()
            if package.loaded["zen-mode"] or pcall(require, "zen-mode") then
              require("zen-mode").open()
            end
          end, 50)
        end,
      },
      ["leave"] = {
        function()
          if package.loaded["zen-mode"] then
            require("zen-mode").close()
          end
        end,
      },
    },
  },
}
