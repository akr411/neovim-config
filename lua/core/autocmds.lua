local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Plugin-specific post-install steps.
local pack_changed_hooks = {
	["blink.cmp"] = function(data)
		if not data.active then
			pcall(vim.cmd.packadd, "blink.lib")
			pcall(vim.cmd.packadd, "blink.cmp")
		end
		vim.fn.jobstart({ "cargo", "build", "--release" }, {
			cwd = data.path,
			on_exit = function(_, code)
				if code ~= 0 then
					vim.schedule(function()
						vim.notify("blink.cmp: cargo build failed (exit " .. code .. ")", vim.log.levels.WARN)
					end)
				end
			end,
		})
	end,
	["markdown-preview.nvim"] = function(data)
		if not data.active then
			pcall(vim.cmd.packadd, "markdown-preview.nvim")
		end
		vim.fn["mkdp#util#install_sync"]()
	end,
}

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = augroup,
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Run plugin post-install steps",
	group = augroup,
	callback = function(ev)
		local data = ev.data or {}
		if data.kind ~= "install" and data.kind ~= "update" then
			return
		end

		local spec = data.spec or {}
		local hook = pack_changed_hooks[spec.name]
		if hook == nil then
			return
		end

		local ok, err = pcall(hook, data)
		if not ok then
			vim.schedule(function()
				vim.notify(spec.name .. " post-install step failed:\n" .. tostring(err), vim.log.levels.WARN)
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Restore last cursor position",
	group = augroup,
	callback = function()
		if vim.o.diff then
			return
		end
		local last_pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)
		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end
		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "ESLint auto-fix on save",
	group = augroup,
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0, name = "eslint" })
		if #clients > 0 then
			vim.cmd("EslintFixAll")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Close notification history with q or Esc",
	group = augroup,
	pattern = "mininotify-history",
	callback = function(ev)
		for _, key in ipairs({ "q", "<Esc>" }) do
			vim.keymap.set("n", key, "<Cmd>bdelete<CR>", { buffer = ev.buf, silent = true })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Stop comment continuation",
	group = augroup,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable autosuggestions for prose files",
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.b.blink_enabled = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Close oil float on Esc",
	group = augroup,
	pattern = "oil",
	callback = function(args)
		local winid = vim.fn.bufwinid(args.buf)
		if winid ~= -1 and vim.api.nvim_win_get_config(winid).relative ~= "" then
			vim.keymap.set("n", "<Esc>", function()
				require("oil").close()
			end, { buffer = args.buf, desc = "Close oil float" })
		end
	end,
})
