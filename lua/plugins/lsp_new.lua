-- Neovim LSP Configuration using modern vim.lsp and vim.diagnostic APIs
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
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim"
    },
    config = function()
        --------------------------------------------------------------------------
        -- Mason Setup
        --------------------------------------------------------------------------
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_enable = false,
        })

        --------------------------------------------------------------------------
        -- Diagnostic Configuration (Modern API)
        -- Customize the appearance of diagnostics
        --------------------------------------------------------------------------
        vim.diagnostic.config({
            virtual_text = { -- Show diagnostics as virtual text (inline)
                prefix = '●', -- Character to prefix virtual text
                source = "if_many", -- Show virtual text if there are multiple diagnostics on the line, or true to always show
                spacing = 4, -- Amount of space to insert before virtual text
            },
            signs = true, -- Show signs in the sign column
            underline = true, -- Underline diagnostics
            update_in_insert = false, -- Do not update diagnostics in insert mode (can be distracting)
            severity_sort = true, -- Sort diagnostics by severity
            float = { -- Configuration for floating diagnostic windows (e.g., shown by vim.diagnostic.open_float)
                border = "rounded", -- Style of the border
                source = "always", -- Show the source of the diagnostic (e.g., "lua-ls")
                focusable = false, -- Make the float window not focusable
                style = "minimal",
                header = "", -- No header
                prefix = "", -- No prefix
            },
        })

        --------------------------------------------------------------------------
        -- LSP Settings (including capabilities and on_attach)
        --------------------------------------------------------------------------
        -- nvim-cmp supports additional LSP capabilities
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- Common `on_attach` callback for all LSP servers
        -- This function is called when an LSP server attaches to a buffer
        local on_attach = function(client, bufnr)
            -- Keymapping options
            local opts = { noremap = true, silent = true, buffer = bufnr }

            -- Use direct function references for cleaner keymaps
            -- See :help vim.lsp.buf and :help vim.diagnostic
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)                                    -- Go to definition
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                                          -- Show hover information (K is a common Vim key for this)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)                                -- Go to implementation
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)                        -- Go to type definition
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)                                -- Rename symbol
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)                           -- Show code actions
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)                                    -- Show references
            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts) -- Format code
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)                          -- Open floating diagnostic window
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)                                     -- Go to previous diagnostic
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)                                     -- Go to next diagnostic
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)                          -- Show diagnostics in location list

            -- Highlight symbol under cursor (optional, requires Neovim 0.8+)
            if client.supports_method("textDocument/documentHighlight") then
                vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "LspDocumentHighlight" })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = bufnr,
                    group = "LspDocumentHighlight",
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    buffer = bufnr,
                    group = "LspDocumentHighlight",
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end

        local lspconfig = require("lspconfig")

        local servers = require("mason-lspconfig").get_installed_servers()
        for _, server_name in ipairs(servers) do
            local server_opts = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig[server_name].setup(server_opts)
        end

        --------------------------------------------------------------------------
        -- nvim-cmp Setup (Your existing setup, looks good)
        --------------------------------------------------------------------------
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from VSCode format
        require("copilot_cmp").setup()                     -- Setup for GitHub Copilot suggestions in cmp

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For luasnip users.
                end,
            },
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Use <CR> to confirm selection (more standard)
                -- ["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Your original mapping
            },
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, ctx)
                        -- Filter out text completions from LSP, if you prefer snippets or other sources for them
                        return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                    end,
                },
                { name = "luasnip" },                 -- Snippets source
                { name = "copilot" },                 -- Copilot source
                { name = "buffer" },                  -- Buffer words source
                { name = "path" },                    -- Path source
                { name = "nvim_lsp_signature_help" }, -- LSP signature help
                { name = "nvim_lua" },                -- Lua API completion for Neovim config
            }),
            -- Optional: add formatting for completion items, e.g., with icons
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons (optional, requires a Nerd Font)
                    vim_item.kind = string.format('%s %s', require('lspkind').presets.default[vim_item.kind] or '',
                        vim_item.kind)
                    -- For nvim_lsp, show the server name in the menu
                    if entry.source.name == "nvim_lsp" and entry.completion_item.data and entry.completion_item.data.server_name then
                        vim_item.menu = "[" .. entry.completion_item.data.server_name .. "]"
                    end
                    return vim_item
                end,
            },
            -- Experimental features if you want to try them
            experimental = {
                ghost_text = true, -- Show ghost text for completion preview
            },
        })

        -- Keymaps for Luasnip
        vim.keymap.set({ "i", "s" }, "<C-j>", function() luasnip.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-k>", function() luasnip.jump(-1) end, { silent = true })
        -- You might want a keymap to expand snippets if not relying on auto-expansion or <CR>
        -- vim.keymap.set({"i"}, "<Tab>", function() if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else -- fallback end end, {silent = true})


        -- Command line completion setup
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }, -- Completions from buffer text for search
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },    -- Path completion for commands
            }, {
                { name = "cmdline" }, -- Command line history and available commands
            }),
        })

        -- Optional: If you use lspkind.nvim for icons in completion menu
        -- Make sure it's installed, e.g. via dependencies:
        -- 'onsails/lspkind.nvim',
        -- And then you can require it in the cmp formatting section.
        -- If not using lspkind, remove the vim_item.kind line in cmp.setup.formatting.format
        -- For the formatting example above to work, you'd need lspkind.
        -- If you don't have it, you can simplify the formatting function or remove it.
        -- For example, without lspkind:
        -- formatting = {
        --   format = function(entry, vim_item)
        --     vim_item.menu = ({
        --       nvim_lsp = "[LSP]",
        --       luasnip = "[Snippet]",
        --       buffer = "[Buffer]",
        --       path = "[Path]",
        --     })[entry.source.name]
        --     return vim_item
        --   end,
        -- },

    end,
}
