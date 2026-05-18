local M = {}

M.plugins = {
	"https://github.com/mfussenegger/nvim-jdtls",
}

function M.setup()
	local group = vim.api.nvim_create_augroup("UserJdtls", { clear = true })

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "java",
		callback = function()
			local ok, mason_registry = pcall(require, "mason-registry")
			if not ok or not mason_registry.is_installed("jdtls") then
				vim.notify("jdtls not installed via mason", vim.log.levels.WARN)
				return
			end

			local function pkg_jars(name, pattern)
				if not mason_registry.is_installed(name) then
					return {}
				end
				return vim.split(
					vim.fn.glob(mason_registry.get_package(name):get_install_path() .. pattern),
					"\n",
					{ trimempty = true }
				)
			end

			local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()

			local root_dir = require("jdtls.setup").find_root({
				".git",
				"mvnw",
				"gradlew",
				"pom.xml",
				"build.gradle",
				"build.gradle.kts",
			})
			if not root_dir then
				return
			end

			local project_name = vim.fs.basename(root_dir)
			local project_id = vim.fn.sha256(root_dir):sub(1, 8)
			local workspace =
				vim.fs.joinpath(vim.fn.stdpath("data"), "jdtls-workspace", project_name .. "-" .. project_id)

			require("jdtls").start_or_attach({
				cmd = {
					jdtls_path .. "/bin/jdtls",
					"--jvm-arg=-Xmx4G",
					"-data",
					workspace,
				},
				root_dir = root_dir,
				settings = {
					java = {
						signatureHelp = { enabled = true },
						contentProvider = { preferred = "fernflower" },
						completion = {
							favoriteStaticMembers = {
								"org.junit.Assert.*",
								"org.junit.jupiter.api.Assertions.*",
								"org.mockito.Mockito.*",
								"java.util.Objects.requireNonNull",
								"java.util.Objects.requireNonNullElse",
							},
							filteredTypes = {
								"com.sun.*",
								"io.micrometer.shaded.*",
								"java.awt.*",
								"jdk.*",
								"sun.*",
							},
						},
						sources = {
							organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
						},
						codeGeneration = {
							toString = {
								template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
							},
							useBlocks = true,
						},
						inlayHints = {
							parameterNames = { enabled = "all" },
						},
					},
				},
				init_options = {
					bundles = vim.list_extend(
						pkg_jars("java-debug-adapter", "/extension/server/*.jar"),
						pkg_jars("java-test", "/extension/server/*.jar")
					),
				},
				on_attach = function(_, bufnr)
					local j = require("jdtls")
					local map = require("core.utils").buf_mapper(bufnr)
					map("n", "<Leader>ji", j.organize_imports, "Java organize imports")
					map("n", "<Leader>jt", j.test_nearest_method, "Java test nearest")
					map("n", "<Leader>jT", j.test_class, "Java test class")
					map("v", "<Leader>jem", function()
						j.extract_method(true)
					end, "Extract method")
					map("n", "<Leader>jev", j.extract_variable, "Extract variable")
					map("n", "<Leader>jec", j.extract_constant, "Extract constant")
					map("n", "<Leader>jR", "<Cmd>JdtRestart<CR>", "Java restart")
				end,
			})
		end,
	})
end

return M
