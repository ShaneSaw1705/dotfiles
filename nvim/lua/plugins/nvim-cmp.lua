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
	-- Key mappings for LuaSnip placeholders
	vim.keymap.set({ "i", "s" }, "<Tab>", function()
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
		end
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		end
	end, { silent = true })
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For luasnip users
			end,
		},
		-- window = {
		-- 	completion = cmp.config.window.bordered(),
		-- 	documentation = cmp.config.window.bordered(),
		-- },
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
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
	vim.g.jsdoc_enable_es6 = 1
	vim.g.jsdoc_formatter = "tsdoc"
end
return M
