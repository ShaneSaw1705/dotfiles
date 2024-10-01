return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" }, -- Add any other LSPs you want
		})

		-- Default setup function for all LSPs
		local default_on_attach = function(client, bufnr)
			-- Notify when LSP attaches
			vim.notify("LSP attached to " .. client.name, vim.log.levels.INFO, { timeout = 1500, title = "LSP Status" })

			-- Set keymap for code action
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"ca",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true, desc = "Code actions" }
			)

			-- Set keymap for diagnostic floating window
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"cd",
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				{ noremap = true, silent = true, desc = "Show diagnostics" }
			)

			-- Set keymap for go to definition
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true, desc = "Go to definition" }
			)
		end

		local default_capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Iterate through each installed LSP and apply default settings
		for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
			require("lspconfig")[server].setup({
				on_attach = default_on_attach,
				capabilities = default_capabilities,
				-- Add any other default options you want here
			})
		end
	end,
}
