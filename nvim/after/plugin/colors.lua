function ColorMyPencils(color)
	color = color or "darcula"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFload", { bg = "none" })
end

ColorMyPencils()
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)