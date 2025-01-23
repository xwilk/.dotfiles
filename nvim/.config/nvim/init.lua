require("config.lazy")
require("config.set")
require("config.remap")
require("config.terminal")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highligh when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
