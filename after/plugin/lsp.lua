-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "pylsp", "tsp_server", "jdtls", "tailwindcss", "cssls", "html", "astro", "clangd"},
})
require("mason-lspconfig").setup_handlers({
    -- Will be called for each installed server that doesn't have
    -- a dedicated handler.
    --
    function(server_name) -- default handler (optional)
        -- https://github.com/neovim/nvim-lspconfig/pull/3232
        if server_name == "tsserver" then
            server_name = "ts_ls"
        end
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server_name].setup({

            capabilities = capabilities,
        })
    end,
})

-- LANGUAGES. THE COMPLETE LIST IS ON: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls
require'lspconfig'.golangci_lint_ls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.quick_lint_js.setup{}
require'lspconfig'.jdtls.setup{}


local cmp = require('cmp')
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    }
})

require("lspconfig").html.setup({
    filetypes = { "html", "javascriptreact", "typescriptreact", "astro" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                flake8 = { enabled = false },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pydocstyle = { enabled = false },
                pylint = { enabled = false },
            }
        }
    }
}

require'lspconfig'.clangd.setup{
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
    },
}
