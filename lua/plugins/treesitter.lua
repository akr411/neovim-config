local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
}

M.opts = {
  ensure_installed = {
    'bash',
    'diff',
    'go',
    'html',
    'javascript',
    'kotlin',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'toml',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  auto_install = true,
  folds = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}

return M
