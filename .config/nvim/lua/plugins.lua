local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

-- Инициализация packer.nvim
require('packer').startup(function(use)
  -- Плагин packer.nvim
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'dense-analysis/ale'
  use 'neoclide/coc.nvim'
  use {'akinsho/toggleterm.nvim', tag = '*', config = function()
  require('toggleterm').setup()
end}

end)
