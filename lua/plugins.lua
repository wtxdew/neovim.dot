-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

--local conf = require("configs")

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'github/copilot.vim'
  use {
    'hrsh7th/nvim-cmp',  
    --config = conf.cmp,
    event = "InsertEnter",
  }
  use 'rafamadriz/friendly-snippets'
  use 'L3MON4D3/LuaSnip'
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  }
  use {
    'numToStr/Comment.nvim',
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
end)
