vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Git diff split" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", "<cmd>Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gs", function()
  vim.cmd("botright 10split")
  vim.cmd("Git ++curwin")
end, { desc = "Git status" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function(args)
    vim.schedule(function()
      vim.keymap.set("n", "<CR>", "dv", {
        buffer = args.buf,
        remap = true,
        desc = "Open file diff from Git status",
      })
    end)
  end,
})
