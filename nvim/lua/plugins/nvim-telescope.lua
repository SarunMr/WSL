local builtin = require('telescope.builtin')
 
require('telescope').setup({
  pickers = {
    find_files = {
      hidden = true
    }
  }
})

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope Git Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})


