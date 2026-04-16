-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- File explorer
vim.keymap.set("n", "<C-b>", vim.cmd.Ex)

-- Delete to black hole register (don't overwrite clipboard)
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })

-- Move lines up/down
vim.keymap.set("n", "<A-k>", ":m-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Run current file
vim.keymap.set("n", "<leader>go", ":GoRun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>js", ":!node %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>py", ":!python3 %<CR>", { noremap = true, silent = true })

-- Remove LazyVim default git keymaps (replaced by fugitive)
pcall(vim.keymap.del, "n", "<leader>gg")
pcall(vim.keymap.del, "n", "<leader>gG")
pcall(vim.keymap.del, "n", "<leader>gb")
pcall(vim.keymap.del, "n", "<leader>gB")
pcall(vim.keymap.del, { "n", "x" }, "<leader>gB")
pcall(vim.keymap.del, "n", "<leader>gf")
pcall(vim.keymap.del, "n", "<leader>gl")
pcall(vim.keymap.del, "n", "<leader>gL")
pcall(vim.keymap.del, "n", "<leader>gY")
pcall(vim.keymap.del, { "n", "x" }, "<leader>gY")

-- Diagnostics
vim.keymap.set("n", "]]", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[[", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Telescope (overrides LazyVim defaults)
-- vim.keymap.set('n', '<leader><leader>', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
-- vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').live_grep() end, { desc = 'Live grep' })
