return {

    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
        --------------------------------------------------------------------------
        -- Mason Setup
        --------------------------------------------------------------------------
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- List the servers you want to have automatically installed by Mason
            ensure_installed = {
                "lua_ls",        -- for Lua
                "pyright",       -- for Python
                "ts_ls",      -- for JavaScript / TypeScript
                "clangd",             -- for C/C++
                "omnisharp"
                -- ... add more LSPs ...
            },
            automatic_installation = true,
        })

        --------------------------------------------------------------------------
        -- LSP Settings (including capabilities)
        --------------------------------------------------------------------------
        -- nvim-cmp supports additional LSP capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Common `on_attach` callback for all LSP servers
        local on_attach = function(client, bufnr)
            -- Example keybindings
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
            vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            -- ... add more keymaps if you'd like ...
        end

        -- Manually set up the servers you want from Mason
        local lspconfig = require("lspconfig")

        -- Example: Lua language server
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = {
                            vim.api.nvim_get_runtime_file("", true),
                            "${3rd}/love2d/library"
                        }
                    },
                    telemetry = { enable = false },
                },
            },
        })

        -- Example: Pyright
        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- Example: TSServer
        lspconfig.ts_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.clangd.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.omnisharp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.html.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig.gdscript.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- lspconfig.bash_ls.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        -- })

        -- ... add more servers if needed ...

        --------------------------------------------------------------------------
        -- nvim-cmp Setup
        --------------------------------------------------------------------------
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
                -- { name = "buffer" },
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim-lua" },
                { name = "luasnip" },
                { name = "copilot" },
                -- You can add more sources if you like
            },
        })

        -- vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
        vim.keymap.set("i", "<C-j>", function() luasnip.jump( 1) end, {silent = true})
        vim.keymap.set("i", "<C-k>", function() luasnip.jump(-1) end, {silent = true})

        -- vim.keymap.set({"i", "s"}, "<C-e>", function()
        --     if luasnip.choice_active() then
        --         luasnip.change_choice(1)
        --     end
        -- end, {silent = true})

        -- Set configuration for specific filetype(s) (e.g., use buffer completion in `/` search)


        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (command line) completion.
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
