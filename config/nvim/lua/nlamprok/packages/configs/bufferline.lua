return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "slant",
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to next tab" })
		keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to previous tab" })
		keymap.set(
			"n",
			"<leader>x",
			":if !&modified | bd | endif<CR>",
			{ noremap = true, silent = true, desc = "Close / Delete current buffer" }
		)
	end,
}
