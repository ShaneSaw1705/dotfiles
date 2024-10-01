return {
	"stevearc/conform.nvim",
	config = function()
		local mason_registry = require("mason-registry")

		-- Function to check if a formatter is installed
		local function is_installed(package_name)
			return mason_registry.is_installed(package_name)
		end

		-- Configure formatters dynamically based on Mason installations
		local formatters_by_ft = {}

		if is_installed("stylua") then
			formatters_by_ft.lua = { "stylua" }
		end

		if is_installed("isort") then
			formatters_by_ft.python = formatters_by_ft.python or {}
			table.insert(formatters_by_ft.python, "isort")
		end

		if is_installed("black") then
			formatters_by_ft.python = formatters_by_ft.python or {}
			table.insert(formatters_by_ft.python, "black")
		end

		if is_installed("rustfmt") then
			formatters_by_ft.rust = { "rustfmt", lsp_format = "fallback" }
		end

		if is_installed("prettierd") then
			formatters_by_ft.javascript = { "prettierd", "prettier", stop_after_first = true }
		end

		-- Setup conform with the dynamically populated formatters
		require("conform").setup({
			formatters_by_ft = formatters_by_ft,
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
