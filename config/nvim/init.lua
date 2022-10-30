-- base
require("nlamprok.base")
require("nlamprok.highlights")
require("nlamprok.colorscheme")
require("nlamprok.keymaps")
require("nlamprok.plugins")

-- lsp related
require("nlamprok.lsp.lspconfig")
require("nlamprok.lsp.lspsaga")
require("nlamprok.lsp.mason")
require("nlamprok.lsp.null-ls")

-- OS related
local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("nlamprok.macos")
end
if is_win then
	require("nlamprok.windows")
end
