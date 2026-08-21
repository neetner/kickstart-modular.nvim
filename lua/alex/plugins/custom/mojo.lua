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
  config = function(_, opts)
    require('mojo').setup(opts)

    -- mojo-lsp-server does not appear to honor settings.mojo.includeDirs sent via
    -- workspace/didChangeConfiguration, regardless of whether it's set before the
    -- client starts, after attach, or via mojo.nvim's own native global opts (all
    -- three were tried and made no difference). The confirmed-working mechanism is
    -- the same `-I <dir>` CLI flag the mojo compiler itself uses (verified via this
    -- project's own `pixi run mojo -I src` task, and mojo-lsp-server --help lists
    -- -I as a server flag too). So instead of LSP settings, build the -I flags
    -- directly into the command line used to spawn the server.
    --
    -- Reads a small per-project JSON file for the include dirs.
    -- Example .mojo-lsp.json:
    --   { "includeDirs": ["src"] }
    vim.lsp.config('mojo', {
      cmd = function(dispatchers, config)
        local root = (config and config.root_dir) or vim.fs.root(0, { 'pixi.toml', '.pixi', 'pyproject.toml', '.venv' })
        local server = require('mojo.env.bin').get_lsp_cmd(root) or { 'mojo-lsp-server' }
        server = vim.deepcopy(server)

        if root then
          local config_path = vim.fs.joinpath(root, '.mojo-lsp.json')
          local f = io.open(config_path, 'r')
          if f then
            local content = f:read '*a'
            f:close()
            local ok, data = pcall(vim.json.decode, content)
            if ok and type(data) == 'table' and data.includeDirs then
              for _, dir in ipairs(data.includeDirs) do
                table.insert(server, '-I')
                table.insert(server, vim.fs.joinpath(root, dir))
              end
            end
          end
        end

        return vim.lsp.rpc.start(server, dispatchers, {})
      end,
    })
  end,
}
