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
		},
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
				language_tree = true,
				is_supported = function()
					if
						vim.fn.strwidth(vim.fn.getline(".")) > 300
						or vim.fn.getfsize(vim.fn.expand("%")) > 1024 * 1024
					then
						return false
					else
						return true
					end
				end,
			},
		})
	end,
}
