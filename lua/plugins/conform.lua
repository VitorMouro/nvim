return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                htmlangular = { "prettierd", "prettier", stop_after_first = true },
            },
            -- format_on_save = {
            --     lsp_format = "fallback",
            --     timeout_ms = 500,
            -- },
            default_format_opts = {
                timeout_ms = 3000,
                async = false, -- not recommended to change
                quiet = false, -- not recommended to change
                lsp_format = "fallback", -- not recommended to change
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>=", function()
            require("conform").format()
        end, { desc = "Format with Conform" })
    end,
}
