if vim.g.started_by_firenvim then return end

require('noice').setup({
    cmdline = {
        enabled = false,
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
        },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                any = {
                    { find = "%d+L, %d+B" },
                    { find = "; after #%d+" },
                    { find = "; before #%d+" },
                },
            },
            view = "mini",
        },
    },
    popupmenu = {
        enabled = true,
        backend = "nui",
    },
    presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
    },
})
