
local M = {
  {'wbthomason/packer.nvim'},
  {'EdenEast/nightfox.nvim'},
  {'github/copilot.vim'},
  {'rafamadriz/friendly-snippets'},
  {'L3MON4D3/LuaSnip'},
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function () 
	    require('plugin-config.blankline').setup()
    end
  },
  { 
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
       require('plugin-config.comment').setup()
    end
  },
  {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = function()
        require('plugin-config.which-key').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugin-config.treesitter").setup()
    end,
  },
  {
    'hrsh7th/nvim-cmp',  
    -- event = "InsertEnter",
    config = function ()
      require('plugin-config.cmp').setup()
    end,
    requires = {
      'neovim/nvim-lspconfig',
      -- 'hrsh7th/cmp-cmdline',
    },
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugin-config.nvimtree').setup()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  {
    "romgrk/barbar.nvim",
    config = function()
      require("plugin-config.bufferline").setup()
    end,
    event = "BufWinEnter",
  }
}

return M 
