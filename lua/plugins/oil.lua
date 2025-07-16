return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("oil").setup({
            use_default_keymaps = false,
            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["<C-l>"] = "actions.refresh",
                ["gs"] = { "actions.change_sort", mode = "n" },
            },
            view_options = {
                show_hidden = true,
            },
            -- columns = {
            --     "icon",
            --     "size",
            --     "mtime",
            -- },
        })
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Oil" })
    end,
}
