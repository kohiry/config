vim.cmd([[colorscheme tokyonight-moon]])

-- ======= lualine =======
local custom_gruvbox = require("lualine.themes.palenight")

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = "#112233"

require("lualine").setup({
	options = { theme = custom_gruvbox },
})
