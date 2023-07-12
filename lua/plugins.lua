local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Pluugins

  -- Mason
use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}

-- Nvimtee
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

-- Lsp
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    -- Snippets
    {'rafamadriz/friendly-snippets'}, -- Optional
 }
}


-- Telescope
use {
	'nvim-telescope/telescope.nvim',
	requires = {
		'nvim-lua/plenary.nvim'
	}
}

-- Treesitter
use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
}

-- Lualine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true
  }
}

-- onedark navarasu
use 'navarasu/onedark.nvim'

-- bufferline

use {'akinsho/bufferline.nvim',
tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

--Undo tree
use 'mbbill/undotree'

--Prettier
use 'jose-elias-alvarez/null-ls.nvim'
use 'MunifTanjim/prettier.nvim'

--Fugitive
use 'tpope/vim-fugitive'


--Gv
use 'junegunn/gv.vim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
