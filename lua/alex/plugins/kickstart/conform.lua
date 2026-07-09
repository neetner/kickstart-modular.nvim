return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        -- mojo's SDK CLI has slower cold-start latency than the other formatters here
        local slow_filetypes = { mojo = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = slow_filetypes[vim.bo[bufnr].filetype] and 3000 or 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        tex = { 'tex-fmt' },
        cls = { 'tex-fmt' },
        sty = { 'tex-fmt' },
        elixir = { 'mix_format' },
        heex = { 'mix_format' },
        eex = { 'mix_format' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        mojo = { 'mojo_format' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        mix_format = {
          command = 'mise',
          args = { 'exec', '--', 'mix', 'format', '-' },
          stdin = true,
        },
        mojo_format = {
          command = function()
            local ok, bin = pcall(function() return require('mojo.env.bin').get_mojo_cmd() end)
            return (ok and bin) or 'mojo'
          end,
          args = { 'format', '$FILENAME' },
          stdin = false,
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
