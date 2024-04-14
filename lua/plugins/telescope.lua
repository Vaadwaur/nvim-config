local keymap = vim.keymap

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	event = 'VimEnter',
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
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
				'fzf',
			},
		})
	end,
	keys = {
		keymap.set("n", "<leader>sk", ":Telescope keymaps<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [K]eymaps" }),

		keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [H]elp" }),

		keymap.set("n", "<leader>sf", ":Telescope find_files<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [F]iles" }),

		keymap.set("n", "<leader>sg", ":Telescope live_grep<CR>",
			{ noremap = true, silent = true, desc = "[S]earch by [G]rep" }),

		keymap.set("n", "<leader>sb", ":Telescope buffers<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [B]uffers" }),

		keymap.set("n", "<leader>ss", ":Telescope spell_suggest<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [S]pellcheck}" }),

		keymap.set("n", "<leader>s?", ":Telescope builtin<CR>",
			{ noremap = true, silent = true, desc = "[S]earch builtin commands" }),

		keymap.set("n", "<leader>sw", ":Telescope grep_string<CR>",
			{ noremap = true, silent = true, desc = "[S]earch current [W]ord" }),

		keymap.set("n", "<leader>sd", ":Telescope diagnostics<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [D]iagnostics" }),

		keymap.set("n", "<leader>sr", ":Telescope resume<CR>",
			{ noremap = true, silent = true, desc = "[S]earch [R]esume previous search" }),

		keymap.set("n", "<leader>s.", ":Telescope oldfiles<CR>",
			{ noremap = true, silent = true, desc = "[S]earch previously opened files" }),
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			'nvim-tree/nvim-web-devicons',
			enabled = vim.g.have_nerd_font
		},
	},
}
