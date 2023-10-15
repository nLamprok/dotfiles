return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Set colorscheme after options
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
