vim.g.mapleader=" "

vim.keymap.set("n", "<C-b>", vim.cmd.Ex)

vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("v", "d", '"_d', { noremap = true })

vim.keymap.set("n", "<leader>go", ":GoRun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>js", ":!node %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>py", ":!python %<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-k>", ":m-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":m+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- vim.keymap.set("i", "jj", "<Esc>")
-- vim.keymap.set("i", "kk", "<Esc>")
-- vim.keymap.set("i", "jk", "<Esc>")
-- vim.keymap.set("i", "kj", "<Esc>")

