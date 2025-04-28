return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("oil").setup({
            use_default_keymaps = false,
            keymaps = {
                ["<CR>"] = "actions.select",
                ["<C-l>"] = "actions.refresh",
            },
            view_options = {
                show_hidden = true,
            }
        })
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" })
    end,
}
