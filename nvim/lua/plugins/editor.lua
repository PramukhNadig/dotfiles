-- Editor productivity: symbol outline, split/join, better folding
return {

  -- ── Aerial: code symbol outline ─────────────────────────────────────────
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
      layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 20,
        default_direction = "prefer_right",
      },
      show_guides = true,
      -- attach aerial to telescope
      attach_mode = "window",
      filter_kind = false, -- show all symbols
    },
    keys = {
      { "<leader>a",  "<cmd>AerialToggle<cr>",  desc = "Symbol outline (aerial)" },
      { "<leader>A",  "<cmd>AerialNavToggle<cr>", desc = "Aerial nav float" },
      { "{",          function() require("aerial").prev() end, desc = "Aerial prev symbol" },
      { "}",          function() require("aerial").next() end, desc = "Aerial next symbol" },
    },
  },

  -- ── TreeSJ: split and join blocks (args, arrays, structs…) ───────────────
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false, max_join_lines = 150 },
    keys = {
      { "gS", function() require("treesj").split() end, desc = "Split block" },
      { "gJ", function() require("treesj").join() end,  desc = "Join block" },
    },
  },

  -- ── nvim-ufo: LSP-powered code folding ───────────────────────────────────
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    opts = {
      provider_selector = function(_, filetype, _)
        -- use LSP + treesitter where available, else indent
        local lsp_ft = { "python", "rust", "go", "ocaml", "lua", "java" }
        if vim.tbl_contains(lsp_ft, filetype) then
          return { "lsp", "treesitter" }
        end
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      -- required by ufo
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    keys = {
      { "zR", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
      { "zK", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then vim.lsp.buf.hover() end
      end, desc = "Peek fold / hover" },
    },
  },
}
