local M = {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
}

M.keys = {
  {
    '<Leader>cf',
    function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end,
    mode = '',
    desc = '[C]ode [F]ormat buffer',
  },
}

M.opts = {
  notify_on_error = true,
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    bash = { 'shfmt' },
    css = { 'prettierd' },
    go = { 'goimports', 'gofumpt' },
    html = { 'prettierd' },
    markdown = { 'prettierd' },
    json = { 'prettierd' },
    javascript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    kotlin = { 'ktlint' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    lua = { 'stylua' },
    python = { 'blackd-client' },
    toml = { 'taplo' },
    yaml = { 'prettierd' },
  },
}

return M
