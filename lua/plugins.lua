-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'github/copilot.vim'
  -- use { "lukas-reineke/cmp-under-comparator" }
	-- use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
	-- use { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" }
	-- use { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" }
	-- use { "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" }
	-- use { "hrsh7th/cmp-path", after = "cmp-tmux" }
	-- use { "f3fora/cmp-spell", after = "cmp-path" }
	-- use { "hrsh7th/cmp-buffer", after = "cmp-spell" }
	-- use { "kdheepak/cmp-latex-symbols", after = "cmp-buffer" }
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
end)
