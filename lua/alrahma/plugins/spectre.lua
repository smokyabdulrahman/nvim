return {
	"nvim-pack/nvim-spetre",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	keys = {
		{ "<leader>S", "<cmd>lua require(\"spectre\").toggle()<CR>", desc = "Toggle Spectre", mode = "n" },
		{ "<leader>sw", "<cmd>lua require(\"spectre\").open_visual({select_word=true})<CR>", desc = "Search current word", mode = "n" },
		{ "<leader>sw", "<esc><cmd>lua require(\"spectre\").open_visual()<CR>", desc = "Search current word V", mode = "v" },
		{ "<leader>sp", "<cmd>lua require(\"spectre\").open_file_search({select_word=true})<CR>", desc = "Search current word V", mode = "n" },
	}
}
