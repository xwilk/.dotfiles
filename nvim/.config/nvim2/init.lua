print("advent of neovim")

require("config.lazy")
require("config.set")
require("config.remap")
require("config.terminal")

-- lua =vim.api - to check api table
-- help nvim_create_autocmd
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highligh when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
