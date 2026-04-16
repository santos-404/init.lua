require('lualine').setup({
    options = {
        theme = 'auto',
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'diagnostics',
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 1 },
        },
        lualine_x = {
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                source = function()
                    local gs = vim.b.gitsigns_status_dict
                    if gs then
                        return { added = gs.added, modified = gs.changed, removed = gs.removed }
                    end
                end,
            },
            'encoding',
            'filetype',
        },
        lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
        },
        lualine_z = {
            function() return os.date('%R') end,
        },
    },
})
