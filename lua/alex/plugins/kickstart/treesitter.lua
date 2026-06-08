return {
  { -- Highlight, edit, navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local ensure_installed = {
        'c', 'lua', 'vim', 'vimdoc', 'query', 'python', 'bibtex', 'latex',
        'elixir', 'heex', 'html', 'css', 'javascript', 'json',
      }

      local ts_config = require 'nvim-treesitter.config'
      local ts_install = require 'nvim-treesitter.install'

      -- Install any parsers from ensure_installed whose .so is missing.
      -- We check only the parser directory (not queries) because query .scm files
      -- are plain text and survive a parser wipe — install_lang() uses the broader
      -- get_installed() (queries + parsers) as its "already done" guard, so we must
      -- pass force=true to override it when we know the .so is actually absent.
      local installed_parsers = ts_config.get_installed 'parsers'
      local to_install = vim.tbl_filter(function(lang)
        return not vim.list_contains(installed_parsers, lang)
      end, ensure_installed)
      if #to_install > 0 then
        ts_install.install(to_install, { force = true })
      end

      -- On every FileType event:
      --   1. Start treesitter highlighting if the parser is available.
      --   2. Auto-install the parser if it is missing (mirrors the old auto_install = true).
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ft = args.match
          local lang = vim.treesitter.language.get_lang(ft) or ft
          local buf = args.buf

          -- Start highlighting (no-op + silent if parser/queries are not available yet)
          pcall(vim.treesitter.start, buf, lang)

          -- Auto-install missing parsers
          local installed = ts_config.get_installed 'parsers'
          if not vim.list_contains(installed, lang) then
            local available = ts_config.get_available()
            if vim.list_contains(available, lang) then
              ts_install.install { lang }
            end
          end
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
