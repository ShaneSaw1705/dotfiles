return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		-- First, set up the filetype association
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "html",
			},
		})

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"html", -- Add HTML parser
				"jsdoc",
				"javascript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"typescript",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
