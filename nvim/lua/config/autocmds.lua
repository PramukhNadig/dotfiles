-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ── Rust: extra rustaceanvim keymaps (buffer-local) ─────────────────────────
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("rustacean_keys", { clear = true }),
  pattern = "rust",
  callback = function(ev)
    local map = function(k, fn, desc)
      vim.keymap.set("n", k, fn, { buffer = ev.buf, desc = desc })
    end
    map("<leader>Rr", function() vim.cmd.RustLsp("runnables") end,      "Rust: runnables")
    map("<leader>Rd", function() vim.cmd.RustLsp("debuggables") end,    "Rust: debuggables")
    map("<leader>Rm", function() vim.cmd.RustLsp("expandMacro") end,    "Rust: expand macro")
    map("<leader>Ro", function() vim.cmd.RustLsp("openDocs") end,       "Rust: open docs.rs")
    map("<leader>Rp", function() vim.cmd.RustLsp("parentModule") end,   "Rust: parent module")
    map("<leader>Rj", function() vim.cmd.RustLsp("joinLines") end,      "Rust: join lines")
    map("<leader>Rc", function() vim.cmd.RustLsp("openCargo") end,      "Rust: open Cargo.toml")
    map("<leader>Rt", function() vim.cmd.RustLsp({ "testables" }) end,  "Rust: testables")
  end,
})

-- ── Go: gopher.nvim keymaps (buffer-local) ──────────────────────────────────
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("gopher_keys", { clear = true }),
  pattern = "go",
  callback = function(ev)
    local map = function(k, fn, desc)
      vim.keymap.set("n", k, fn, { buffer = ev.buf, desc = desc })
    end
    map("<leader>Gtj", function() vim.cmd("GoTagAdd json") end,  "Go: add json tags")
    map("<leader>Gty", function() vim.cmd("GoTagAdd yaml") end,  "Go: add yaml tags")
    map("<leader>Gtr", function() vim.cmd("GoTagRm") end,        "Go: remove tags")
    map("<leader>Gie", function() vim.cmd("GoIfErr") end,        "Go: generate if err")
    map("<leader>Gim", function() vim.cmd("GoImpl") end,         "Go: implement interface")
  end,
})

-- ── Auto-enter Zen Mode for leetcode buffers
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
