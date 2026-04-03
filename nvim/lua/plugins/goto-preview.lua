return {
  "rmagatti/goto-preview",
  event = "LspAttach",
  opts = {
    width = 100,
    height = 20,
    border = "rounded",
    default_mappings = false,
    post_open_hook = function(_, win)
      -- close the preview with q or <Esc>
      vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
      end, { buffer = true, silent = true })
    end,
  },
  keys = {
    { "gpd", function() require("goto-preview").goto_preview_definition() end, desc = "Preview definition" },
    { "gpi", function() require("goto-preview").goto_preview_implementation() end, desc = "Preview implementation" },
    { "gpt", function() require("goto-preview").goto_preview_type_definition() end, desc = "Preview type definition" },
    { "gpr", function() require("goto-preview").goto_preview_references() end, desc = "Preview references" },
    { "gpc", function() require("goto-preview").close_all_win() end, desc = "Close all previews" },
  },
}
