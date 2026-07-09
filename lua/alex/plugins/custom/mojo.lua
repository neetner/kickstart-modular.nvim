return {
  'Sarctiann/mojo.nvim',
  main = 'mojo',
  lazy = false, -- plugin registers its own filetype detection; can't lazy-load on ft='mojo'
  opts = {
    -- mojo.nvim's own conform integration makes a second, independent conform.setup()
    -- call that doesn't know about our format_on_save config, resetting it to disabled.
    -- We wire the mojo formatter into conform.lua directly instead (single setup() call).
    format = { enabled = false },
  },
}
