-- Global options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_keepdir = 0
vim.g.netrw_preview = 1
vim.g.netrw_cursor = 2
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Options
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.breakindent = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 0
vim.o.redrawtime = 1500
vim.o.lazyredraw = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:·,nbsp:␣'
vim.o.fillchars = 'eob: '
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.smoothscroll = true
vim.o.confirm = true
vim.o.spell = true
vim.o.spelllang = 'en'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.winborder = 'single'

vim.diagnostic.config {
  severity_sort = true,
  float = {
    border = 'single',
    source = 'if_many',
  },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}
