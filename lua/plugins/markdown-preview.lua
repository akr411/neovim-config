local M = {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    require('lazy').load { plugins = { 'markdown-preview.nvim' } }
    vim.fn['mkdp#util#install']()
  end,
}

M.keys = {
  {
    '<Leader>cp',
    ft = 'markdown',
    '<Cmd>MarkdownPreviewToggle<CR>',
    desc = '[C]ode markdown [P]review',
  },
}

M.config = function()
  vim.cmd [[do FileType]]
end

return M
