vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "kj", "<ESC>", { silent = true })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { silent = true })
vim.keymap.set("x", "p", '"_dP')
vim.keymap.set({ "n", "v" }, "<Leader>x", '"_d')

vim.keymap.set("n", "<Leader>e", "<Cmd>Explore<CR>")

vim.keymap.set("n", "<Leader>bn", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<Leader>bp", "<Cmd>bprevious<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<Leader>sv", "<Cmd>vsplit<CR>")
vim.keymap.set("n", "<Leader>sh", "<Cmd>split<CR>")
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>")

vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==")
vim.keymap.set("v", "<A-j>", "<Cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", "<Cmd>m '<-2<CR>gv=gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set('n', '[q', vim.cmd.cprev)
vim.keymap.set('n', ']q', vim.cmd.cnext)

vim.keymap.set('n', '[b', vim.cmd.bprevious)
vim.keymap.set('n', ']b', vim.cmd.bnext)

vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

vim.keymap.set("n", "<Leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

vim.keymap.set("n", "<Leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
