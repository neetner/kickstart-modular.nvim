return {
  'amitds1997/remote-nvim.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('remote-nvim').setup {
      remote = {
        copy_dirs = {
          config = {
            base = vim.fn.stdpath 'config',
            dirs = '*',
            compression = {
              enabled = true,
              additional_opts = { '--exclude=.git' },
            },
          },
        },
      },
    }
  end,
}
