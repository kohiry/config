require('settings')
require('term')
require('ale')
require('keymaps')
require('plugins')
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
require('colorscheme')
