return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.operators").setup()
		-- require("mini.pairs").setup()
		require("mini.bracketed").setup()
		require("mini.files").setup({
			vim.keymap.set(
				"n",
				"<leader>e",
				':lua require("mini.files").open()<CR>',
				{ noremap = true, silent = true }
			),
		})
	end,
}
