return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		input = { enabled = true },
		styles = {
			input = {
				relative = "cursor",
				row = -3,
				col = 0,
			},
		},
	},
}
