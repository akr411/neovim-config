vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set('n', '<C-s>', vim.cmd.update)

vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-S-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-S-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-S-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-S-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-S-Left>', '<C-w><')
vim.keymap.set('n', '<C-S-Down>', '<C-w>-')
vim.keymap.set('n', '<C-S-Up>', '<C-w>+')
vim.keymap.set('n', '<C-S-Right>', '<C-w>>')
vim.keymap.set('n', 'sh', vim.cmd.split)
vim.keymap.set('n', 'sv', vim.cmd.vsplit)

-- vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('x', 'p', 'P')
vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set(
  'n',
  '<Leader>bp',
  vim.cmd.bprev,
  { desc = '[B]uffer [P]revious' }
)
vim.keymap.set('n', '<Leader>bn', vim.cmd.bnext, { desc = '[B]uffer [N]ext' })
vim.keymap.set(
  'n',
  '<Leader>bd',
  vim.cmd.bdelete,
  { desc = '[B]uffer [D]elete' }
)
vim.keymap.set('n', '<Leader>bb', '<C-6>', { desc = '[B]uffer toggle' })

vim.keymap.set('n', '<Leader>e', vim.cmd.Explore, { desc = 'Open explorer' })
vim.keymap.set(
  'n',
  '<Leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

vim.keymap.set('n', '<Leader>pc', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  print('file:', path)
end, { desc = 'Full [P]ath [C]opy' })
