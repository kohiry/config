vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 0

-- Указываем линтеры для разных языков
vim.g.ale_linters = {
	lua = { "luacheck" },
	python = { "flake8", "mypy", "pylint" },
	javascript = { "eslint", "jshint" },
	typescript = { "eslint", "tsserver", "tslint" },
	rust = { "rust-analyzer", "clippy" },
	sh = { "shellcheck" },
	json = { "jsonlint" },
	yaml = { "yamllint" },
}

-- Указываем фиксаторы для разных языков
vim.g.ale_fixers = {
	["*"] = { "remove_trailing_lines", "trim_whitespace" },
	lua = { "stylua" },
	python = { "black", "isort" },
	javascript = { "prettier", "eslint" },
	typescript = { "prettier", "eslint" },
	rust = { "rustfmt" },
	sh = { "shfmt" },
	json = { "jq" },
	yaml = { "prettier" },
}
