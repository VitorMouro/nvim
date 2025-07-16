return {

	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = false,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) // Using ufo.nvim, see ufo.lua
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

			local original_handler = vim.lsp.handlers["textDocument/hover"]
			vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
				config = config or {}
				config.border = "rounded"
				return original_handler(err, result, ctx, config)
			end
		end

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lspconfig.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
			},
			root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
			single_file_support = true,
		})

		lspconfig.eslint.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "vscode-eslint-language-server", "--stdio" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			root_dir = lspconfig.util.root_pattern("package.json", ".git"),
			single_file_support = true,
		})

		lspconfig.angularls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Diagnostics
		-- vim.diagnostic.config({
		--           float = {
		--               border = "rounded"
		--           },
		-- 	virtual_text = {
		-- 		prefix = "",
		-- 		spacing = 1,
		-- 	},
		-- 	signs = true,
		-- 	underline = true,
		-- 	update_in_insert = false,
		-- 	severity_sort = true,
		-- })

		vim.diagnostic.config({
            virtual_text = {
                prefix = "",
                spacing = 1,
                source = "if_many",
            },
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})

	end,
}
