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
  {
    'hrsh7th/nvim-cmp',
    -- event = "InsertEnter",
    config = function()
      require('plugins.configs.cmp').setup()
    end,
    requires = {
      'neovim/nvim-lspconfig',
    },
  },
  { 'ray-x/cmp-treesitter' },
  { 'hrsh7th/cmp-path' },
  { "hrsh7th/cmp-buffer", },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'github/copilot.vim' },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  { "hrsh7th/cmp-nvim-lsp" },
  { "tamago324/nlsp-settings.nvim" },
  { "williamboman/nvim-lsp-installer", },

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
    config = function()
      require('plugins.configs.lualine').Setup()
    end,
    requires = { 
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
  },
  { "navarasu/onedark.nvim" },
  { 'EdenEast/nightfox.nvim' },
}

return M



--[[
  { "jose-elias-alvarez/null-ls.nvim", },
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  { "rcarriga/nvim-notify",
    config = function()
      require("lvim.core.notify").setup()
    end,
    requires = { "nvim-telescope/telescope.nvim" },
    disable = not lvim.builtin.notify.active or not lvim.builtin.telescope.active,
  },
  { "Tastyep/structlog.nvim" },
  { "nvim-lua/popup.nvim" },
  -- Telescope
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local utils = require "lvim.utils"
      local paths = {
        utils.join_paths(get_runtime_dir(), "site", "pack", "packer", "start", "friendly-snippets"),
      }
      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  { "max397574/lua-dev.nvim", module = "lua-dev", },
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = function()
      require("lvim.core.autopairs").setup()
    end,
    disable = not lvim.builtin.autopairs.active,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPost", },
  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("lvim.core.project").setup()
    end,
    disable = not lvim.builtin.project.active,
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("lvim.core.dap").setup()
    end,
    disable = not lvim.builtin.dap.active,
  },
  -- Debugger management
  { "Pocco81/dap-buddy.nvim", branch = "dev", disable = not lvim.builtin.dap.active, },
  -- alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("lvim.core.alpha").setup()
    end,
    disable = not lvim.builtin.alpha.active,
  },
  -- SchemaStore
  { "b0o/schemastore.nvim", },
}
--]]



