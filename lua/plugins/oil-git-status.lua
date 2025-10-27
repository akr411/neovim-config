local M = {
  'refractalize/oil-git-status.nvim',
  dependencies = { 'stevearc/oil.nvim' },
}

M.opts = {
  show_ignored = true,
  symbols = {
    index = {
      ['!'] = '!', -- ignored
      ['?'] = '?', -- untracked
      ['A'] = '+', -- added
      ['C'] = 'c', -- copied
      ['D'] = 'x', -- deleted
      ['M'] = '*', -- modified
      ['R'] = '>', -- renamed
      ['T'] = 't', -- type changed
      ['U'] = '=', -- unmerged/conflict
      [' '] = ' ', -- unmodified
    },
    working_tree = {
      ['!'] = '!', -- ignored
      ['?'] = '?', -- untracked
      ['A'] = '+', -- added
      ['C'] = 'c', -- copied
      ['D'] = 'x', -- deleted
      ['M'] = '*', -- modified
      ['R'] = '>', -- renamed
      ['T'] = 't', -- type changed
      ['U'] = '=', -- unmerged/conflict
      [' '] = ' ', -- unmodified
    },
  },
}

return M
