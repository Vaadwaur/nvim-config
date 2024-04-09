return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{ "onsails/lspkind.nvim" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		}
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			--require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				--[[snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},]]
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous seggustion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-p>"] = cmp.mapping.select_prev_item(), -- previous seggustion
					["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-y>"] = cmp.mapping.confirm({ selecte = true }),
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					-- { name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),
				-- configure lspkind for vscode-like icons
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
