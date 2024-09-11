return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			ensure_installed = {
				"c",
				"cpp",
				"gitignore",
				"lua",
				"markdown",
				"python",
				"regex",
				"vim",
			},
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
