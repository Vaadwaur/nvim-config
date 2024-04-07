local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- vim.keymap.set("n", "gf", "<CMD>Lspsaga lsp_finder<CR>", opts)
	-- vim.keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", opts)
	-- vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", opts)
	-- vim.keymap.set("n", "<leader>D", "<CMD>Lspsaga show_line_diagnostics<CR>", opts)
	-- vim.keymap.set("n", "<leader>d", "<CMD>Lspsaga show_cursor_diagnostics<CR>", opts)
	-- vim.keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", opts)
	-- vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", opts)
	-- vim.keymap.set("n", "<leader>pd", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts)
	-- vim.keymap.set("n", "<leader>nd", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts)
	-- vim.keymap.set("n", "<leader>lo", "<CMD>LSoutlineToggle<CR>", opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	--vim.keymap.set("n", "<leader>pd", vim.lsp.diagnostic_jump_prev, opts)
	--vim.keymap.set("n", "<leader>nd", vim.lsp.diagnostic_jump_next, opts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	if client.name == "clangd" then
		keymap.set("n", "<leader>ko", "<cmd>ClangdSwitchSourceHeader<CR>",
			{ noremap = true, silent = true, buffer = bufnr, desc = "Switch source/header" })
	end
	if client.name == "pyright" then
		keymap.set("n", "<Leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
