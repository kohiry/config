require('settings')
require('lsp')
require('keymaps')
require('tree_sitter')
require('plugins')
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
require('colorscheme')
