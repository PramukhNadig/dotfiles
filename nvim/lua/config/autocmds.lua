-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-enter Zen Mode for leetcode buffers
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("leetcode_zen", { clear = true }),
  pattern = "leetcode.nvim",
  callback = function()
    vim.defer_fn(function()
      if package.loaded["zen-mode"] or pcall(require, "zen-mode") then
        require("zen-mode").open()
      end
    end, 100)
  end,
})
