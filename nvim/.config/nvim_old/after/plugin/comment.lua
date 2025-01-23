require('nvim_comment').setup()

vim.keymap.set('v', '<C-_>', ':CommentToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-_>', ':CommentToggle<CR>j', { silent = true })
