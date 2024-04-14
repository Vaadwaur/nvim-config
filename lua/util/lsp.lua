local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	keymap.set("n", "<leader>bs", require("telescope.builtin").lsp_document_symbols,
		vim.tbl_extend("keep", opts, { desc = "LSP: [B]uffer [S]ymbols" }))

	-- keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
	-- keymap.set("n", "gr", vim.lsp.buf.references, opts)
	keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	--vim.keymap.set("n", "<leader>pd", vim.lsp.diagnostic_jump_prev, opts)
	--vim.keymap.set("n", "<leader>nd", vim.lsp.diagnostic_jump_next, opts)
	keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

	keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols,
		vim.tbl_extend("keep", opts, { desc = "LSP: [W]roject [S]ymbols" }))

	keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	if client.name == "clangd" then
		keymap.set("n", "<leader>ko", "<cmd>ClangdSwitchSourceHeader<CR>",
			vim.tbl_extend("keep", opts, { desc = "Switch source/header" }))
	end
	if client.name == "pyright" then
		keymap.set("n", "<Leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
