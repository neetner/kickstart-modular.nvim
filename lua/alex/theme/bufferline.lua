return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'EdenEast/nightfox.nvim',
  },
  config = function()
    -- vim.cmd.colorscheme 'nordfox'
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        numbers = 'ordinal',
        -- OR
        -- numbers = "buffer_id",  -- Shows actual buffer IDs
        -- OR
        -- numbers = "both",  -- Shows "ordinal/buffer_id"
        -- OR
        -- numbers = function(opts)  -- Custom format
        --   return string.format('%s', opts.ordinal)
        -- end,
        separator_style = 'slant',
        show_duplicate_prefix = true,
        -- indicator = {
        --   style = 'underline',
        -- },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo Tree',
            text_align = 'center',
            separator = true,
          },
        },
      },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
