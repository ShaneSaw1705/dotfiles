return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			mode = "n",
			"<leader>e",
			"<cmd>Oil<CR>",
			desc = "Open the Oil file viewer",
		},
	},
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
	config = function()
		local oil = require("oil")

		-- Setup Oil with options (this ensures Oil is configured properly)
		oil.setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		})

		-- Automatically set keybinding for q only when in an Oil buffer
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				-- Buffer-local mapping to close Oil only when Oil is active
				vim.api.nvim_buf_set_keymap(0, "n", "q", "", {
					callback = function()
						oil.close()
					end,
					desc = "Close Oil",
					noremap = true,
					silent = true,
				})
			end,
		})
	end,
}
