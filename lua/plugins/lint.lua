local M = {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
}

M.config = function()
  local lint = require 'lint'

  lint.linters_by_ft = {
    bash = { 'shellcheck' },
    go = { 'golangcilint' },
    javascript = { 'eslint_d' },
    javascriptreact = { 'eslint_d' },
    kotlin = { 'ktlint' },
    markdown = { 'markdownlint-cli2' },
    python = { 'ruff' },
    typescript = { 'eslint_d' },
    typescriptreact = { 'eslint_d' },
    sh = { 'shellcheck' },
  }

  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    desc = 'Auto-lint on save and text change',
    group = vim.api.nvim_create_augroup('lint', { clear = true }),
    callback = function()
      if vim.bo.modifiable then
        lint.try_lint()
      end
    end,
  })
end

return M
