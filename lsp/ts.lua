return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx" },
	root_markers = {
		"package.json",
		"index.ts",
		"index.tsx",
		"index.js",
		"index.jsx",
	},
	settings = {
		ts = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
