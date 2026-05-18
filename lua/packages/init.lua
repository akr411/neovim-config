local function load(specs, mod)
	local ok, spec = pcall(require, mod)
	if not ok then
		vim.notify("packages: failed to load " .. mod .. "\n" .. spec, vim.log.levels.ERROR)
	else
		table.insert(specs, spec)
	end
end

local specs = {}

-- shared infra
load(specs, "packages.deps")

-- ui / appearance
load(specs, "packages.colorscheme")
load(specs, "packages.devicons")
load(specs, "packages.bufferline")
load(specs, "packages.mini")
load(specs, "packages.starter")
load(specs, "packages.illuminate")
load(specs, "packages.indent-blankline")
load(specs, "packages.which-key")

-- syntax / editing
load(specs, "packages.treesitter")
load(specs, "packages.highlight-colors")
load(specs, "packages.format")
load(specs, "packages.refactoring")
load(specs, "packages.markdown")

-- completion
load(specs, "packages.blink")

-- lsp
load(specs, "packages.lsp")
load(specs, "packages.mason")
load(specs, "packages.jdtls")

-- navigation / files
load(specs, "packages.fzf")
load(specs, "packages.oil")
load(specs, "packages.aerial")
load(specs, "packages.session")

-- git
load(specs, "packages.fugitive")
load(specs, "packages.gitsigns")
load(specs, "packages.diffview")

-- debugging / testing
load(specs, "packages.dap")
load(specs, "packages.neotest")

-- terminal / misc
load(specs, "packages.toggleterm")
load(specs, "packages.todo-comments")
load(specs, "packages.trouble")

local all_plugins = {}
for _, spec in ipairs(specs) do
	for _, plugin in ipairs(spec.plugins or {}) do
		table.insert(all_plugins, plugin)
	end
end
vim.pack.add(all_plugins)

for _, spec in ipairs(specs) do
	if spec.setup then
		local ok, err = pcall(spec.setup)
		if not ok then
			vim.notify("packages: setup failed\n" .. err, vim.log.levels.ERROR)
		end
	end
end
