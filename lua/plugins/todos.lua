return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            keywords = {
                VITOR = {
                    icon = " ",
                    color = "error",
                    alt = { "TODO" },
                },
            },
        })

        -- :TodoTelescope
        local todo = require("todo-comments")
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", {
            desc = "Find TODOs",
        })
    end,
}
