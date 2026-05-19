local M = {}

M.plugins = {}

local patched_clients = {}
local setup_bufs = {}

function M.setup()
	vim.opt.completeopt = { "menu", "menuone", "noinsert", "popup", "fuzzy" }
	vim.opt.shortmess:append("c")

	local map = require("core.utils").mapper()
	map("i", "<CR>", function()
		return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
	end, "Confirm completion or newline", { expr = true })

	map("i", "<C-j>", function()
		return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
	end, "Next completion or fallback", { expr = true })

	map("i", "<C-k>", function()
		return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
	end, "Prev completion or fallback", { expr = true })

	map("i", "<Down>", function()
		return vim.fn.pumvisible() == 1 and "<C-n>" or "<Down>"
	end, nil, { expr = true })

	map("i", "<Up>", function()
		return vim.fn.pumvisible() == 1 and "<C-p>" or "<Up>"
	end, nil, { expr = true })

	local keyword_chars = vim.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_", "")

	local group = vim.api.nvim_create_augroup("NativeCompletion", { clear = true })

	vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
		group = group,
		callback = function(ev)
			setup_bufs[ev.buf] = nil
		end,
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = group,
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if not client or not client:supports_method("textDocument/completion") then
				return
			end

			if not patched_clients[client.id] then
				patched_clients[client.id] = true
				local provider = client.server_capabilities.completionProvider or {}
				local set = {}
				for _, c in ipairs(provider.triggerCharacters or {}) do
					set[c] = true
				end
				for _, c in ipairs(keyword_chars) do
					set[c] = true
				end
				provider.triggerCharacters = vim.tbl_keys(set)
				client.server_capabilities.completionProvider = provider
			end

			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

			if setup_bufs[ev.buf] then
				return
			end
			setup_bufs[ev.buf] = true

			vim.api.nvim_create_autocmd("InsertCharPre", {
				buffer = ev.buf,
				group = group,
				callback = function()
					if vim.v.char == "(" or vim.v.char == "," then
						vim.schedule(function()
							local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/signatureHelp" })
							if #clients > 0 then
								vim.lsp.buf.signature_help()
							end
						end)
					end
				end,
			})
		end,
	})
end

return M
