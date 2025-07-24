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
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            require("conform").format({ lsp_fallback = true })
        end, { desc = "Format with Conform" })
    end,
}
