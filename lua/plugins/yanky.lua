return {
    "gbprod/yanky.nvim",
    config = function()
        require("yanky").setup({
        })

        vim.keymap.set("n", "<leader>fh", "<cmd>YankyRingHistory<CR>", { desc = "YankyHistory" })
    end,
}
