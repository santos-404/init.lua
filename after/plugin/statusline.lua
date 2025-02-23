require('lualine').setup({
    options = {
        theme = 'tokyonight',  -- Change to 'gruvbox', 'onedark', etc.
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },  -- Normal, Insert, Visual, etc.
        lualine_b = { 'branch', 'diff' },
        lualine_c = { { 'filename', path = 1 } }, -- Show full file path
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' } -- Line:Column
    },
})

