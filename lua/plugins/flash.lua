return {
  "folke/flash.nvim",
  opts = {
    highlight = {
      backdrop = true,
    },
    label = {
      -- show label before AND after the match for more visibility
      after = true,
      before = false,
    },
  },
  -- Override highlight groups after colorscheme loads
  config = function(_, opts)
    require("flash").setup(opts)

    local function set_hl()
      -- Bright yellow label, black text, bold — hard to miss
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#ffffff", fg = "#000000", bold = true })
      -- Dim everything else more aggressively
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#555555" })
    end

    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_hl })
  end,
}
