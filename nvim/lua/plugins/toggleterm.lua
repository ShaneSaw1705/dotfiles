return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.5 -- Half of the window height
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.5 -- Half of the window width
				end
			end,
			direction = "horizontal", -- default direction
		})

		-- Keybinding for Ctrl + / to toggle horizontal terminal in both normal and terminal modes
		vim.api.nvim_set_keymap(
			"n",
			"<C-/>",
			"<Cmd>ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"t",
			"<C-/>",
			"<Cmd>ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
