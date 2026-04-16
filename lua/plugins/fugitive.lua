return {
  {
    "tpope/vim-fugitive",
    event = "BufReadPre",
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",           desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<cr>",    desc = "Git commit" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>",    desc = "Git diff split" },
      { "<leader>gb", "<cmd>Git blame<cr>",     desc = "Git blame" },
      { "<leader>gp", "<cmd>Git push<cr>",      desc = "Git push" },
      { "<leader>gP", "<cmd>Git pull<cr>",      desc = "Git pull" },
      { "<leader>gl", "<cmd>Git log<cr>",       desc = "Git log" },
      { "<leader>gL", "<cmd>Git log %<cr>",     desc = "Git log (current file)" },
      { "<leader>gf", "<cmd>Git fetch<cr>",     desc = "Git fetch" },
      { "<leader>gw", "<cmd>Gwrite<cr>",        desc = "Git write (stage file)" },
      { "<leader>gr", "<cmd>Gread<cr>",         desc = "Git read (checkout file)" },
    },
  },
}
