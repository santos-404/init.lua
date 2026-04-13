return {
  -- Disable lazygit floating window integration
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = false },
    },
  },

  -- Disable neo-tree file explorer sidebar
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Disable bufferline (tab bar for buffers)
  { "akinsho/bufferline.nvim", enabled = false },

  -- Disable persistence (session save/restore)
  { "folke/persistence.nvim", enabled = false },
}
