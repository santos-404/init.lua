require('mini.indentscope').setup({
    symbol = '│',
    options = { try_as_border = true },
    draw = {
        animation = require('mini.indentscope').gen_animation.quadratic({
            easing = 'out',
            duration = 100,
            unit = 'total',
        }),
    },
})

-- Disable in certain filetypes where it doesn't make sense
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help', 'dashboard', 'mason', 'notify', 'lazy', 'TelescopePrompt' },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})
