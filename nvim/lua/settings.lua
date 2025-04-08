-- ~/.config/nvim/lua/settings.lua
vim.opt.number = true -- Включить номера строк
vim.opt.relativenumber = true -- Включить относительные номера строк
vim.opt.tabstop = 4 -- Количество пробелов, которые отображаются для табуляции
vim.opt.shiftwidth = 4 -- Количество пробелов для автоматического отступа
vim.opt.expandtab = true -- Преобразовать табы в пробелы
vim.opt.autoindent = true -- Автоматический отступ
vim.opt.mouse = "" -- Включить поддержку мыши
vim.opt.ignorecase = true -- Игнорировать регистр при поиске
vim.opt.smartcase = true -- Учитывать регистр, если есть заглавные буквы
vim.opt.swapfile = false  -- Отключить создание swap файлов

-- neo tree
require("neo-tree").setup({
	default = {
		filesystem = {
			show_hidden_files = true, -- Показывать скрытые файлы
			hide_dotfiles = false, -- Не скрывать файлы, начинающиеся с точки
		},
	},
})

-- emmit
vim.g.user_emmet_leader_key = ","
-- Настройки ALE
vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_trigger = { ".", "(", "[", ":" }
vim.g.ale_completion_auto_select = 1
vim.g.ale_javascript_stylelint_config = "/home/max/.config/nvim/ale/stylelintrc.json"
