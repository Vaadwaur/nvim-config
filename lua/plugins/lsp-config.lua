return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			automatic_installation = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = require("util.lsp").on_attach

			-- set default root marker for all clients
			vim.lsp.config('*', {
				root_markers = { '.git' },
			})

			-- C and C++
			vim.lsp.config.clangd = {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
				filetypes = { 'c', 'cpp' },
			}

			-- lua
			vim.lsp.config.lua_ls = {
				copabilities = capabilities,
				on_attach = on_attach,
			}

			vim.lsp.enable({ "clangd", "lua_ls" })

			--[[
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
				telemetry = { enable = false },
			},
		},
	})
	]]

			--[[
	-- python
	lspconfig.pyright.setup({
		copabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})
	]]

			--[[
	-- lua
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- python
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- local clangformat = require("efmls-configs.formatters.clang_format")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"c",
			"cpp",
			"lua",
			"python",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				-- c = { clangformat },
				-- cpp = { clangformat },
			},
		},
	})
	]]
		end,
		dependencies = {
			"windwp/nvim-autopairs",
			-- "creativenull/efmls-configs-nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
}
