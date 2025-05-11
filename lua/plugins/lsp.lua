return {

    "neovim/nvim-lspconfig",

    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "zbirenbaum/copilot-cmp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets"
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
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
            vim.keymap.set("v", "<leader>f", vim.lsp.buf.format, opts)
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
        end

        local lspconfig = require("lspconfig")

        local servers = require("mason-lspconfig").get_installed_servers()
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- Diagnostics
        vim.diagnostic.config({
            virtual_text = {
                prefix = "",
                spacing = 1,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })


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
                    entry_filter = function (entry, ctx)
                        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                    end
                },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim-lua" },
                { name = "luasnip" },
                { name = "copilot" },
            },
        })

        vim.keymap.set("i", "<C-j>", function() luasnip.jump( 1) end, {silent = true})
        vim.keymap.set("i", "<C-k>", function() luasnip.jump(-1) end, {silent = true})

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
