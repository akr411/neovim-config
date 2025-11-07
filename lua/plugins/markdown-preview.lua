local M = {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
}

M.keys = {
  {
    '<Leader>cp',
    ft = 'markdown',
    '<Cmd>MarkdownPreviewToggle<CR>',
    desc = '[C]ode markdown [P]review',
  },
}

return M
