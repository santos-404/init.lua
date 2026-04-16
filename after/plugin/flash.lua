require("flash").setup({
    highlight = {
        backdrop = true,
    },
    label = {
        after = true,
        before = false,
    },
})

local function set_hl()
    vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#ffffff", fg = "#000000", bold = true })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#555555" })
end

set_hl()
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_hl })

vim.keymap.set({ "n", "x", "o" }, "f", function() require("flash").jump() end, { desc = "Flash" })
