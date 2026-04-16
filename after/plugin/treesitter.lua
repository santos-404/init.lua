-- nvim-treesitter v1.0+ API: no more configs module.
-- Highlight is handled automatically by Neovim's built-in treesitter support.
-- Install parsers with :TSInstall <lang>
require('nvim-treesitter').setup()

-- Enable treesitter-based indentation for supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "go", "javascript", "typescript", "java", "html", "astro", "c_sharp" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
