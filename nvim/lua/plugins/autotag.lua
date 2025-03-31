return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = false,
				enable_close_on_slash = false,
			},
			filetypes = {
				"html",
				"xml",
				"php",
				"blade",
				"blade.php",
			},
		})
	end,
}
