lua << EOF

-- The following chunk is meant to be used with Plug 'Shatur/neovim-ayu'
require('ayu').setup({
    mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {}, -- A dictionary with a group names associated with a dictionary with parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})
require('ayu').colorscheme()

-- Then add the lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  }
}

EOF
