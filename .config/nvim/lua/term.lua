require("toggleterm").setup({
	direction = "float",
})

vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"t",
	"<C-t>",
	"<C-\\><C-n><Cmd>exe v:count1 . 'ToggleTerm'<CR>",
	{ noremap = true, silent = true }
)
