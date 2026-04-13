return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- mason = true (default); let mason manage installation
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        -- rust_analyzer is managed by rustaceanvim — don't configure here
      },
    },
  },
}
