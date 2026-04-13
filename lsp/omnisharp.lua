return {
    cmd = { 'omnisharp', '--languageserver' },
    filetypes = { 'cs' },
    root_markers = { '*.sln', '*.csproj', '.git' },
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "gd", require("omnisharp_extended").lsp_definition, {
        buffer = bufnr,
        silent = true,
        noremap = true,
        desc = "Go to definition (omnisharp extended)",
      })
    end,
}
