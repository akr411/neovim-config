vim.keymap.set("i", "kj", "<ESC>", { silent = true, desc = "Exit insert mode" })
vim.keymap.set("n", "j", "gj", { silent = true, desc = "Down visual line" })
vim.keymap.set("n", "k", "gk", { silent = true, desc = "Up visual line" })
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { desc = "Clear search highlight" })
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })
-- <Leader>D: avoids conflict with <Leader>d (debug) and <Leader>x (trouble)
vim.keymap.set({ "n", "v" }, "<Leader>D", '"_d', { desc = "Delete to void" })

vim.keymap.set("n", "<Leader>e", "<Cmd>Oil<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<Leader>E", function()
	require("oil").toggle_float()
end, { desc = "Explorer float" })

vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<Leader>bn", "<Cmd>bnext<CR>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<Leader>bp", "<Cmd>bprevious<CR>", { silent = true, desc = "Buffer previous" })
vim.keymap.set("n", "<Leader>bd", function()
	require("mini.bufremove").delete()
end, { silent = true, desc = "Buffer delete" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right split" })

vim.keymap.set("n", "<Leader>sv", "<Cmd>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<Leader>sh", "<Cmd>split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase split height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease split height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase split width" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Prev quickfix item" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix item" })

vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

vim.keymap.set("v", "<Leader>es", "<Cmd>'<,'>sort<CR>", { desc = "Sort selection" })

vim.keymap.set("n", "<Leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("file: " .. path)
end, { desc = "Copy file path" })

vim.keymap.set("n", "<Leader>pu", "<Cmd>PackUpdate<CR>", { desc = "Pack update" })
vim.keymap.set("n", "<Leader>pl", "<Cmd>PackList<CR>", { desc = "Pack list" })
vim.keymap.set("n", "<Leader>pc", "<Cmd>PackClean<CR>", { desc = "Pack clean" })

vim.keymap.set("n", "<Leader>N", function()
	require("mini.notify").show_history()
end, { desc = "Notification history" })

vim.keymap.set("n", "<Leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
