return {
	"hrsh7th/nvim-cmp",
	version = false,
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"zbirenbaum/copilot-cmp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()
		require("copilot_cmp").setup()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
			},
			sources = {
				{
					name = "nvim_lsp",
					entry_filter = function(entry, ctx)
						return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
					end,
				},
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim-lua" },
				{ name = "luasnip" },
				{ name = "copilot" },
			},
			window = {
				completion = { border = "single" },
				documentation = { border = "single" },
			},
		})

		vim.keymap.set("i", "<C-j>", function()
			luasnip.jump(1)
		end, { silent = true })
		vim.keymap.set("i", "<C-k>", function()
			luasnip.jump(-1)
		end, { silent = true })

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
