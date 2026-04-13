-- Unified debugger: Python, Go, Rust (codelldb already in mason)
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "williamboman/mason.nvim",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue / Start" },
      { "<leader>dn", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>dR", function() require("dap").restart() end, desc = "Restart" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval(nil, { enter = true }) end, desc = "Eval expression", mode = { "n", "v" } },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ── UI ──────────────────────────────────────────────────────────────
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▶" },
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.40 },
              { id = "breakpoints", size = 0.20 },
              { id = "stacks",      size = 0.20 },
              { id = "watches",     size = 0.20 },
            },
            size = 38,
            position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- auto open/close UI with session
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

      -- ── Signs ────────────────────────────────────────────────────────────
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "○", texthl = "DapBreakpointRejected" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine" })
      vim.fn.sign_define("DapLogPoint",            { text = "◉", texthl = "DapLogPoint" })

      -- ── Virtual text ─────────────────────────────────────────────────────
      require("nvim-dap-virtual-text").setup({ commented = true })

      -- ── Python (debugpy via mason) ───────────────────────────────────────
      local debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      if vim.fn.filereadable(debugpy) == 1 then
        require("dap-python").setup(debugpy)
      end

      -- ── Go (delve via mason) ─────────────────────────────────────────────
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
          },
        },
      })

      -- ── Rust / C++ (codelldb already installed by mason) ─────────────────
      -- rustaceanvim picks up codelldb automatically; no manual adapter needed
    end,
  },
}
