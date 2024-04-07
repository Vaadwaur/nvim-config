local keymap = vim.keymap

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
				file_ignore_patterns = { ".git/", "build/" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
				live_grep = {
					theme = "dropdown",
					previewer = false,
				},
				find_buffers = {
					theme = "dropdown",
					previewer = false,
				},
			},
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})
	end,
	keys = {
		keymap.set("n", "<leader>sk", ":Telescope keymaps<CR>"),
		keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>"),
		keymap.set("n", "<leader>sf", ":Telescope find_files<CR>"),
		keymap.set("n", "<leader>sg", ":Telescope live_grep<CR>"),
		keymap.set("n", "<leader>sb", ":Telescope buffers<CR>"),
		keymap.set("n", "<leader>ss", ":Telescope builtin<CR>"),
		keymap.set("n", "<leader>sw", ":Telescope grep_string<CR>"),
		keymap.set("n", "<leader>sd", ":Telescope diagnostics<CR>"),
		keymap.set("n", "<leader>sr", ":Telescope resume<CR>"),
		keymap.set("n", "<leader>s.", ":Telescope oldfiles<CR>"),
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
