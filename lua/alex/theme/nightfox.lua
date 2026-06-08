-- https://github.com/EdenEast/nightfox.nvim
return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme
      -- can be any of
      --- nightfox
      --- dayfox
      --- dawnfox
      --- duskfox
      --- nordfox
      --- terafox
      vim.cmd [[colorscheme nordfox]]
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
