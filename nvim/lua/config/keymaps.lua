-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Competitive programming: <F5> saves and runs the current file via ~/cp/bin/r,
-- feeding input.txt from the same directory when it exists
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local file = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")
  local input = dir .. "/input.txt"
  local cmd = "cd " .. vim.fn.shellescape(dir) .. " && " .. vim.fn.expand("~/cp/bin/r") .. " " .. vim.fn.shellescape(file)
  if vim.fn.filereadable(input) == 1 then
    cmd = cmd .. " " .. vim.fn.shellescape(input)
  end
  vim.cmd("botright 15split | terminal " .. cmd)
end, { desc = "Run current file (cp)" })
