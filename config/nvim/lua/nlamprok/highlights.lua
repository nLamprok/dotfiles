local opt = vim.opt -- for conciseness

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

opt.termguicolors = true -- enable gui colors (most colorschemes need that)
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.winblend = 0 -- fully opaque popup for floating windows
opt.wildoptions = "pum" -- show popup for completion
opt.pumblend = 5 -- almost opaque popup for completion suggestions
