-- Language-specific productivity enhancements for Python, Rust, Go, OCaml
return {

  -- ── Mason: ensure all tools are installed ────────────────────────────────
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright", "ruff", "debugpy",
        -- Go (gopls installed via `go install` but mason can manage it too)
        "gopls", "goimports", "gofumpt", "delve", "gomodifytags", "impl",
        -- Rust (rust-analyzer managed by rustup/brew; codelldb already present)
        "codelldb",
        -- OCaml (ocamllsp via opam is preferred; this is a fallback)
        -- General
        "stylua", "lua-language-server",
      },
    },
  },

  -- ── Treesitter: ensure parsers for all target languages ─────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "python", "rust", "go", "gomod", "gowork", "gosum",
        "ocaml", "ocaml_interface",
        "toml", "ron",
      })
    end,
  },

  -- ── Python: tighten pyright + venv-selector keymaps ─────────────────────
  {
    "linux-cultist/venv-selector.nvim",
    keys = {
      { "<leader>pv", "<cmd>VenvSelect<cr>",       desc = "Select Python venv" },
      { "<leader>pV", "<cmd>VenvSelectCached<cr>", desc = "Use cached Python venv" },
    },
  },

  -- ── Rust: rust-analyzer tuning + crates.nvim keymaps ────────────────────
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true, loadOutDirsFromCheck = true },
            checkOnSave = { command = "clippy" },
            procMacro = { enable = true },
            inlayHints = {
              bindingModeHints         = { enable = true },
              closureCaptureHints      = { enable = true },
              lifetimeElisionHints     = { enable = true, useParameterNames = true },
              reborrowHints            = { enable = "always" },
            },
          },
        },
      },
    },
  },
  {
    "saecki/crates.nvim",
    keys = {
      { "<leader>cv", function() require("crates").show_versions_popup() end,    ft = "toml", desc = "Crate versions" },
      { "<leader>cf", function() require("crates").show_features_popup() end,    ft = "toml", desc = "Crate features" },
      { "<leader>cd", function() require("crates").open_documentation() end,     ft = "toml", desc = "Crate docs" },
      { "<leader>cu", function() require("crates").upgrade_crate() end,          ft = "toml", desc = "Upgrade crate" },
      { "<leader>cU", function() require("crates").upgrade_all_crates() end,     ft = "toml", desc = "Upgrade all crates" },
    },
  },

  -- ── Go: struct tags, if-err, interface stubs ────────────────────────────
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function() vim.cmd("silent! GoInstallDeps") end,
    opts = {},
  },

  -- ── Neogen: docstring scaffolding (all langs) ────────────────────────────
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        python = { template = { annotation_convention = "google" } },
        rust   = { template = { annotation_convention = "rustdoc" } },
        go     = { template = { annotation_convention = "godoc" } },
      },
    },
    keys = {
      { "<leader>ng", function() require("neogen").generate() end, desc = "Generate docstring" },
    },
  },
}
