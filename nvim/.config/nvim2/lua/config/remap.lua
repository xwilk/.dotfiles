-- move block up/down and reindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- repalce text but do not override the clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- make next yank copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to void registry
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- open project in tmux session
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", { silent = true })

-- source current file
-- run current line
-- run current visual block
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- navigate quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<CR>")

-- copy path to clipboard
vim.keymap.set("n", "<leader>cfp", ":let @+ = expand('%:p')<CR>")
vim.keymap.set("n", "<leader>cp", ":let @+ = expand('%')<CR>")

-- plugins
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
