return {
	"neanias/everforest-nvim",
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			transparent_background_level = 2,
		})
		vim.cmd([[colorscheme everforest]])
	end,
}
