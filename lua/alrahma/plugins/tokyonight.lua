return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- Lua
		require("tokyonight").setup({
			-- use the night style
			style = "night",
			-- disable italic for functions
			styles = {
				functions = {},
			},
			-- Change the "hint" color to the "orange" color, and make the "error" color bright red
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,
		})
		vim.cmd("colorscheme tokyonight-night")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
	end,
}
