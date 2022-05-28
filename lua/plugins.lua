local M = {
  { 'wbthomason/packer.nvim' },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function()
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

  -- Syntex
  { 'github/copilot.vim' },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugin-config.treesitter").setup()
    end,
  },
  { 'rafamadriz/friendly-snippets' },
  { 'L3MON4D3/LuaSnip' },
  { "tamago324/nlsp-settings.nvim" },
  { "williamboman/nvim-lsp-installer", },

  -- cmp
  {
    'hrsh7th/nvim-cmp',
    -- event = "InsertEnter",
    config = function()
      require('plugin-config.cmp').setup()
    end,
    requires = {
      'neovim/nvim-lspconfig',
      -- 'hrsh7th/cmp-cmdline',
    },
  },
  { 'ray-x/cmp-treesitter' },
  { 'hrsh7th/cmp-path' },
  { "hrsh7th/cmp-nvim-lsp" },
  { 'saadparwaiz1/cmp_luasnip' },

  --
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
    "lewis6991/gitsigns.nvim",

    config = function()
      require("plugin-config.gitsigns").setup()
    end,
    event = "BufRead",
    -- disable = not lvim.builtin.gitsigns.active,
  },


  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugin-config.telescope").setup()
    end,
    requires = { { 'nvim-lua/plenary.nvim' } },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },

  -- UI
  {
    "romgrk/barbar.nvim",
    config = function()
      require("plugin-config.bufferline").setup()
    end,
    event = "BufWinEnter",
  },
  { "navarasu/onedark.nvim" },
  { 'EdenEast/nightfox.nvim' },
  { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
}

return M
