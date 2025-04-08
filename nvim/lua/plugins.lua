local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Инициализация packer.nvim
require("packer").startup(function(use)
	-- Плагин packer.nvim
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use("ryanoasis/vim-devicons")
	use("stevanmilic/nvim-lspimport")

    use('nvim-treesitter/nvim-treesitter')

    use'nvim-treesitter/nvim-treesitter-context'  -- Дополнительная контекстная подсветка


    -- LSP и автодополнение
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Форматирование и линтеры
    use "nvimtools/none-ls.nvim"
    use "mfussenegger/nvim-lint"


	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("kyazdani42/nvim-web-devicons")
	use("olrtg/nvim-emmet")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})
end)
