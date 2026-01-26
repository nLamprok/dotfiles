return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Filter out jsonc as it's been removed (json parser handles it now)
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "jsonc"
      end, opts.ensure_installed or {})

      -- Add our parsers
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      })

      -- Register json parser for jsonc filetype
      vim.treesitter.language.register("json", "jsonc")

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}
