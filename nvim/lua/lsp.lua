-- Инициализация Mason (он ставит LSP сервера)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "lua_ls"  }, -- Автоматическая установка Pyright
})

-- Настройка LSP
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
        -- Автоформатирование при сохранении
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
        })
        -- Показ ошибок при наведении (popup)
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
            end
        })
    end
})
-- Настройка диагностик (ошибок)
vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Кружочек перед ошибками
        spacing = 4,
    },
    signs = true,       -- Показывать значки в "гуттере" (колонке слева)
    update_in_insert = false, -- Не обновлять в режиме вставки
    severity_sort = true, -- Показывать сначала самые важные ошибки
    float = {
        border = "rounded",
        source = "always",  -- Показывать, откуда ошибка (LSP/линтер)
        header = "",
        prefix = "",
    },
})

-- Настройка автодополнения
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" }
    })
})
require("lint").linters_by_ft = {
    python = { "flake8" }
}
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function() require("lint").try_lint() end
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Форматтер для Python
        null_ls.builtins.formatting.black.with({
            extra_args = { "--fast" }  -- можно добавить аргументы, например для более быстрого форматирования
        }),

        -- Линтер
        null_ls.builtins.diagnostics.flake8,
    }
})

-- Автоформатирование при сохранении
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end
})

