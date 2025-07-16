return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			-- Fullscreen
			defaults = {
				layout_config = {
					horizontal = { width = 0.99, height = 0.99 },
					vertical = { width = 0.99, height = 0.99 },
				},
			},
		})

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
