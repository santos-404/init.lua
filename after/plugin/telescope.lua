local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-S-f>', builtin.live_grep, { desc = 'Telescope live grep' })

require('telescope').setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    winblend = 10,  -- Makes the background slightly transparent
    color_devicons = true,
    file_ignore_patterns = { "node_modules", "venv", ".venv" }
  }
})
