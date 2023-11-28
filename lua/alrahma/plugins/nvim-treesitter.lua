return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "java", "javascript", "kotlin", "typescript", "html", "css" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enabled = true,
			additional_vim_regex_highlighting = false,
		}
	},
}
