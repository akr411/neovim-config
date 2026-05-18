local M = {}

--- Returns a buffer-local keymap setter with silent=true baked in.
--- Avoids repeating opts on every map call inside LspAttach / on_attach.
function M.buf_mapper(bufnr)
	local base = { buffer = bufnr, silent = true }
	return function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", base, { desc = desc }))
	end
end

return M
