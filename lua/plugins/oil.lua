return {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
        require("oil").setup({
            use_default_keymaps = false,
            keymaps = {
                ["<CR>"] = "actions.select",
            },
        })
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" })
    end,
}
