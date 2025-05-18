return {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = {
		"go.mod",
		"go.sum",
		"main.go",
	},
	settings = {
		go = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
