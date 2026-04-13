return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "moon", -- main | moon | dawn
    dark_variant = "moon",
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },
    -- tweak palette slightly warmer/pinker
    palette = {
      moon = {
        love = "#eb6f92",  -- errors/deletion (vivid pink)
        gold = "#f6c177",  -- warnings
        rose = "#ebbcba",  -- identifiers (warm rose)
        pine = "#31748f",  -- keywords (teal-blue)
        foam = "#9ccfd8",  -- types
        iris = "#c4a7e7",  -- functions (lavender)
      },
    },
    highlight_groups = {
      -- make the cursor line a little more visible
      CursorLine = { bg = "highlight_low" },
      -- softer line numbers
      LineNr = { fg = "muted" },
      CursorLineNr = { fg = "rose", bold = true },
    },
  },
}
