local nvim_lsp = require("lspconfig")

-- Настройка LSP для Python с pyright
nvim_lsp.pyright.setup({
	on_attach = function(client, bufnr)
		require("cmp").setup.buffer({
			sources = { { name = "nvim_lsp" } },
		})
	end,
})

-- Настройка LSP для Lua с lua-ls
nvim_lsp.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Настройки ALE
vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_trigger = { ".", "(", "[", ":" }
vim.g.ale_completion_auto_select = 1

-- Указание линтеров для различных языков
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

-- Указание фиксаторов для различных языков
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

-- Настройки nvim-cmp
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-space>"] = cmp.mapping.complete(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	},
})
