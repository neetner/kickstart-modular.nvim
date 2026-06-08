return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      theme = 'auto', -- tokyonight',
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
