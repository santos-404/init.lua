local ft = require('Comment.ft')

ft.set('c_sharp', { '//%s', '/*%s*/' })

require('Comment').setup({
    pre_hook = function(ctx)
        return ft.get(vim.bo.filetype, ctx.ctype) or vim.bo.commentstring
    end,
})
