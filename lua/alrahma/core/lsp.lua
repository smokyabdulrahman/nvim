vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

-- diagnostic
vim.diagnostic.config({
	underline = true,
	signs = true,
	float = {
		source = "if_many",
		border = "rounded",
	},
})

-- enabled servers
vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("sourcekit")
-- vim.lsp.enable("ts")
vim.lsp.enable("go")

-- lsp mappings
local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local opts = { buffer = args.buf, remap = false }

		vim.keymap.set("n", "<leader>gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "single",
			})
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help({
				border = "single",
			})
		end, opts)
	end,
})
-- default mappings by nvim lsp
-- Mappings:
-- -- grn in Normal mode maps to vim.lsp.buf.rename()
-- -- grr in Normal mode maps to vim.lsp.buf.references()
-- -- gri in Normal mode maps to vim.lsp.buf.implementation()
-- -- gO in Normal mode maps to vim.lsp.buf.document_symbol()
-- -- gra in Normal and Visual mode maps to vim.lsp.buf.code_action()
-- -- CTRL-S in Insert and Select mode maps to vim.lsp.buf.signature_help()
-- -- Mouse popup-menu includes an "Open in web browser" item when you right-click on a URL.
-- -- Mouse popup-menu includes a "Go to definition" item when LSP is active in the buffer.
-- -- Mouse popup-menu includes "Show Diagnostics", "Show All Diagnostics" and "Configure Diagnostics" items when there are diagnostics in the buffer.
-- -- ]d-default and [d-default accept a count.
-- -- [D-default and ]D-default jump to the first and last diagnostic in the current buffer, respectively.
-- -- Mappings inspired by Tim Pope's vim-unimpaired:
-- -- [q, ]q, [Q, ]Q, [CTRL-Q, ]CTRL-Q navigate through the quickfix list
-- -- [l, ]l, [L, ]L, [CTRL-L, ]CTRL-L navigate through the location-list
-- -- [t, ]t, [T, ]T, [CTRL-T, ]CTRL-T navigate through the tag-matchlist
-- -- [a, ]a, [A, ]A navigate through the argument-list
-- -- [b, ]b, [B, ]B navigate through the buffer-list
-- -- [<Space>, ]<Space> add an empty line above and below the cursor
-- -- [[ and ]] in Normal mode jump between shell prompts for shells which emit OSC 133 sequences ("shell integration" or "semantic prompts").
