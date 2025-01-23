-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
end)

-- send shell command to terminal, extend this idea later
-- vim.keymap.set("n", "<space>ee", function()
--   vim.fn.chansend(job_id, { "ls -al\r\n" })
-- end)

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
