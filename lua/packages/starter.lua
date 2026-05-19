local M = {}
local icons = require("core.icons")

M.plugins = {} -- mini.nvim already loaded by mini.lua

-- ANSI Shadow font, one entry per weekday
local day_art = {
	[1] = [[
███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝
╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝
███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║
╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[2] = [[
███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗
████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝
██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝
██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[3] = [[
████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝
   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝
   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║
   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[4] = [[
██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝
██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝
╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║
 ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[5] = [[
████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗
╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝
   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝
   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║
   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[6] = [[
███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗
██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝
█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝
██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝
██║     ██║  ██║██║██████╔╝██║  ██║   ██║
╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
	[7] = [[
███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗
██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝
███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝
╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝
███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║
╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝]],
}

local function header()
	local t = os.date("*t")
	local msg = t.hour < 12 and icons.starter.morning .. " Good morning"
		or t.hour < 17 and icons.starter.afternoon .. " Good afternoon"
		or icons.starter.evening .. " Good evening"
	local date = icons.starter.calendar .. os.date("%B %d, %Y")
	return day_art[t.wday] .. "\n\n" .. date .. "  ·  " .. msg
end

local function actions()
	return {
		{
			name = icons.starter.find .. "Find file",
			action = "lua require('fzf-lua').files()",
			section = "Quick actions",
		},
		{
			name = icons.starter.grep .. "Live grep",
			action = "lua require('fzf-lua').live_grep()",
			section = "Quick actions",
		},
		{
			name = icons.starter.recent .. "Recent files",
			action = "lua require('fzf-lua').oldfiles()",
			section = "Quick actions",
		},
		{
			name = icons.starter.sessions .. "Sessions",
			action = "AutoSession search",
			section = "Quick actions",
		},
		{
			name = icons.starter.new .. "New file",
			action = "enew",
			section = "Quick actions",
		},
		{
			name = icons.starter.quit .. "Quit",
			action = "qall",
			section = "Quick actions",
		},
	}
end

local function recent_files()
	local thunk = require("mini.starter").sections.recent_files(8, true)
	return function()
		local items = thunk()
		for _, item in ipairs(items) do
			item.section = "Recent"
		end
		return items
	end
end

local hl_cache = {}
local function icon_hook(content)
	if not icons.have_nerd_font then
		return content
	end
	local devicons = require("nvim-web-devicons")
	local coords = require("mini.starter").content_coords(content, "item")
	for i = #coords, 1, -1 do
		local l_num, u_num = coords[i].line, coords[i].unit
		local unit = content[l_num][u_num]
		if unit.item and unit.item.section == "Recent" then
			local fname = unit.item.name:gsub("%s+%b()$", "")
			local ext = fname:match("%.([^%.]+)$") or ""
			local icon, _, color = devicons.get_icon_color(fname, ext, { default = true })
			local hl_group = "MiniStarterFileIcon_" .. (ext ~= "" and ext or fname:gsub("[^%w]", "_"))
			if not hl_cache[hl_group] then
				vim.api.nvim_set_hl(0, hl_group, { fg = color })
				hl_cache[hl_group] = true
			end
			table.insert(content[l_num], u_num, {
				string = icon,
				type = "item_bullet",
				hl = hl_group,
				_item = unit.item,
				_place_cursor = false,
			})
		end
	end
	return content
end

function M.setup()
	local starter = require("mini.starter")
	local plugin_count = #vim.pack.get(nil, { info = false })
	local nvim_version = vim.version()

	starter.setup({
		autoopen = false,
		evaluate_single = true,
		header = header,
		items = {
			actions,
			recent_files,
		},
		content_hooks = {
			icon_hook,
			starter.gen_hook.adding_bullet(" ", false),
			starter.gen_hook.aligning("center", "center"),
		},
		footer = function()
			local ms = vim.g._startup_ms and string.format("  ·  %s%dms", icons.starter.startup, vim.g._startup_ms)
				or ""
			return string.format(
				"  %s%d plugins  ·  %sv%d.%d.%d%s",
				icons.starter.plugins,
				plugin_count,
				icons.starter.neovim,
				nvim_version.major,
				nvim_version.minor,
				nvim_version.patch,
				ms
			)
		end,
		silent = true,
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniStarterOpened",
		callback = function(ev)
			vim.opt_local.cursorline = false
			local map = require("core.utils").mapper(ev.buf)
			map("n", "j", function()
				starter.update_current_item("next")
			end, nil, { nowait = true })
			map("n", "k", function()
				starter.update_current_item("prev")
			end, nil, { nowait = true })
			map("n", "<Esc>", function()
				starter.set_query("")
			end, nil, { nowait = true })
		end,
	})
end

return M
