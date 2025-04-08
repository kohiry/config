vim.api.nvim_set_keymap("n", "<F1>", ":Neotree toggle=true<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<F5>", ":qa!<cr>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-Space>", ":ALEComplete<cr>", { noremap = true })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Показать ошибку под курсором" })

