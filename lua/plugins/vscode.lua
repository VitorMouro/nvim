return {
	"Mofiqul/vscode.nvim",
	config = function()
		vim.opt.background = "light"
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({})

		vim.cmd("colorscheme vscode")
	end,
}
