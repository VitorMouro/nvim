return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        }
    },

    config = function()
        require("telescope").setup({
            -- Fullscreen
            defaults = {
                layout_config = {
                    horizontal = { width = 0.95, height = 0.95 },
                    vertical = { width = 0.95, height = 0.95 },
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        previewer = false,
                        width = 0.5,
                        height = 0.5,
                    }),
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (Telescope)" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (Telescope)" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers (Telescope)" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags (Telescope)" })
        vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Registers (Telescope)" })
        vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Git status (Telescope)" })
        vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "Resume (Telescope)" })
    end,
}
