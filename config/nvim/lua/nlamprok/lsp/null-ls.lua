-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions -- to setup code actions

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Helper to conditionally register eslint handlers only if eslint is
-- configured. If eslint is not configured for a project, it just fails.
local function has_eslint_configured(utils)
	return utils.root_has_file(".eslintrc.js")
end

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		-- to disable file types use
		-- "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		diagnostics.flake8,
		diagnostics.mypy,
		diagnostics.eslint_d.with({ condition = has_eslint_configured }),

		code_actions.eslint_d.with({ condition = has_eslint_configured }),

		formatting.phpcbf,
		formatting.stylua, -- lua formatter
		formatting.prettier.with({
			-- Enable conditionally if and only if eslint_d is not enabled.
			-- This can be for either non-project files and for filetypes that
			-- eslintd does not support.
			condition = function()
				local eslintd_enabled = #null_ls.get_source({
					name = "eslint_d",
					method = null_ls.methods.FORMATTING,
				})
				return eslintd_enabled == 0
			end,
		}),
	},
	diagnostics_format = "[#{c}] #{m} (#{s})",
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
