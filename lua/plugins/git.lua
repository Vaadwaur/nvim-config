return {
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				current_line_blame_opts = {
					delay = 250,
				},
			})
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "git preview" })
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "git toggle lineb lame" })
		end
	}
}
