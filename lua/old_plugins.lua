-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'github/copilot.vim'
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function () 
	    require('configs.blankline').setup()
    end
  }
  use { 'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
       require('configs.comment').setup()
    end
  }
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = function()
        require('configs.which-key').setup()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("configs.treesitter").setup()
    end,
  }
  use {
    'hrsh7th/nvim-cmp',  
    -- event = "InsertEnter",
    config = function ()
      require('configs.cmp').setup()
    end,
    requires = {
      'neovim/nvim-lspconfig',
      -- 'hrsh7th/cmp-cmdline',
    },
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('configs.nvimtree').setup()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use "saadparwaiz1/cmp_luasnip"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-path"

end)
