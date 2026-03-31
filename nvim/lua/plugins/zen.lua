return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {
      window = {
        backdrop = 0.92,
        width = 0.80,
        height = 1,
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = true,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = true },
      },
      on_open = function()
        -- disable indent guides for cleaner look
        pcall(vim.cmd, "IBLDisable")
      end,
      on_close = function()
        pcall(vim.cmd, "IBLEnable")
      end,
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {
      dimming = {
        alpha = 0.30,
        inactive = false,
      },
      context = 12,
      treesitter = true,
    },
  },
}
