return {
	"VonHeikemen/lsp-zero.nvim",
	version = "v3.x",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Lint, Format Support
		"nvimtools/none-ls.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		local cmp = require('cmp')
		local cmp_select = {behavior = cmp.SelectBehavior.Select}
		local cmp_mappings = lsp.defaults.cmp_mappings({
		  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		  ["<C-Space>"] = cmp.mapping.complete(),
		})

		cmp_mappings['<Tab>'] = nil
		cmp_mappings['<S-Tab>'] = nil

		lsp.on_attach(function(client, bufnr)
		  local opts = {buffer = bufnr, remap = false}

		  vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
		  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
		  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		require('mason').setup({})
		require('mason-lspconfig').setup({
		  	-- Replace the language servers listed here 
		  	-- with the ones you want to install
		  	ensure_installed = {'tsserver','pyright', 'ruff'},
		  	handlers = {
		    		lsp.default_setup,
		  	},
		  	setup_nvim_cmp = {
		  		mapping = cmp_mappings
			},
			set_preferences = {
		    		suggest_lsp_servers = false,
		    		sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I'
		    		}
			}
		})

		vim.diagnostic.config({
		    virtual_text = true
		})

		-- Lint, Formatting
		local null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.ruff,
			},
		})
	end,
}
