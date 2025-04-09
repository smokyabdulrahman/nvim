-- if you need help; read this -> https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
}
