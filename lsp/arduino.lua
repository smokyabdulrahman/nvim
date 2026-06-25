local util = require("lspconfig.util")

---@type vim.lsp.Config
return {
	filetypes = { "arduino", "c", "cpp" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(util.root_pattern("*.ino")(fname))
	end,
	cmd = {
		"arduino-language-server",
		"-cli-config",
		"$HOME/Library/Arduino15/arduino-cli.yaml",
	},
	capabilities = {
		textDocument = {
			---@diagnostic disable-next-line: assign-type-mismatch
			semanticTokens = vim.NIL,
		},
		workspace = {
			---@diagnostic disable-next-line: assign-type-mismatch
			semanticTokens = vim.NIL,
		},
	},
}
