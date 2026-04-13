return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>ff",
      function() require("telescope.builtin").live_grep() end,
      desc = "Live Grep",
    },
  },
}
