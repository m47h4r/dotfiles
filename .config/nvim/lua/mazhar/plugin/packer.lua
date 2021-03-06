local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer is not found! Please fix it mate.")
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

return packer.startup(function(use)
-- almighty packer himself!
use 'wbthomason/packer.nvim'
-- colorscheme
use 'ellisonleao/gruvbox.nvim'

-- file-tree explorer
use 'kyazdani42/nvim-tree.lua'

-- Telescope
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
-- plugin for better sort
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- plugin for devicons
use 'kyazdani42/nvim-web-devicons'

-- lsp
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'
-- lsp autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'

-- lualine
use 'nvim-lualine/lualine.nvim'

-- comment
use 'numToStr/Comment.nvim'
-- support for tsx commenting
use 'JoosepAlviste/nvim-ts-context-commentstring'

use 'wesQ3/vim-windowswap'
use 'terryma/vim-multiple-cursors'
use 'airblade/vim-gitgutter'
use 'qpkorr/vim-bufkill'
use 'tpope/vim-surround'
use 'tpope/vim-fugitive'
use 'tpope/vim-repeat'
use 'tpope/vim-sleuth'
use 'sbdchd/neoformat'
use 'jiangmiao/auto-pairs'
use 'easymotion/vim-easymotion'
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

-- managing session
use 'xolox/vim-session'
-- required for vim-session
use 'xolox/vim-misc'

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
