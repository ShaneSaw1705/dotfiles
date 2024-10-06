local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip", -- Luasnip completion source
		"L3MON4D3/LuaSnip", -- Snippet engine
		"garymjr/nvim-snippets",
		"rafamadriz/friendly-snippets", -- Collection of predefined snippets
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	-- Set the pumheight to limit the number of visible completion items
	vim.opt.pumheight = 10 -- Adjust the number of items you'd like to see in the completion menu

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	-- Load friendly snippets (includes Go snippets)
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" }, -- Enable luasnip for snippet completions
		}, {
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

	-- For cmdline completions
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
