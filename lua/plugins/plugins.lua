local M = {
  -- Packer
  { 'wbthomason/packer.nvim' },

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugins.configs.treesitter").setup()
    end,
  },
  { 'rafamadriz/friendly-snippets' },
  { 'L3MON4D3/LuaSnip' },

  -- Completion
  { "tamago324/nlsp-settings.nvim" },
  { "williamboman/nvim-lsp-installer", },
  {
    'hrsh7th/nvim-cmp',
    -- event = "InsertEnter",
    config = function()
      require('plugins.configs.cmp').setup()
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
  { 'github/copilot.vim' },

  -- Tools
  {
    'numToStr/Comment.nvim',
    event = "BufRead",
    config = function()
      require('plugins.configs.comment').setup()
    end
  },
  {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = function()
      require('plugins.configs.which-key').Setup()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.configs.telescope").setup()
    end,
    requires = { { 'nvim-lua/plenary.nvim' } },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  {
    "akinsho/toggleterm.nvim",  
    config = function()
      require("plugins.configs.toggleterm").setup()
    end,
  },

  -- Appearance
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = function()
      require('plugins.configs.blankline').setup()
    end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('plugins.configs.nvimtree').setup()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("plugins.configs.gitsigns").setup()
    end,
    event = "BufRead",
    -- disable = not lvim.builtin.gitsigns.active,
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.configs.bufferline').setup()
    end,
    branch = "main",
    event = "BufWinEnter",
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  { "navarasu/onedark.nvim" },
  { 'EdenEast/nightfox.nvim' },
}

return M
