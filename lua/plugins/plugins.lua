local M = {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("plugins.configs.treesitter").setup()
        end,
        tag="v0.9.1",
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require("plugins.configs.ts-context").setup()
        end,
    },
    { 'rafamadriz/friendly-snippets' },
    { 'L3MON4D3/LuaSnip' },
    -- {'sbdchd/neoformat'},

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
    {
        'github/copilot.vim',
        tag = 'v1.10.2',
    },
    {
        'mhartington/formatter.nvim',
        config = function()
            require('plugins.configs.formatter')
        end,
    },

    -- LSP
    { 'neovim/nvim-lspconfig' },
    { "hrsh7th/cmp-nvim-lsp" },
    { "tamago324/nlsp-settings.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
        lazy = true,
        dependencies = "mason.nvim",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.configs.mason").setup()
        end,
        lazy = true,
    },


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
        -- config = function()
            -- require("plugins.configs.telescope").setup()
        -- end,
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
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "junegunn/vim-easy-align" },

    -- Appearance
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufRead",
        config = function()
            require('plugins.configs.blankline').setup()
        end
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
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
        "shortcuts/no-neck-pain.nvim",
        config = function()
            require('plugins.configs.noneckpain').setup()
        end,
    },

    -- Top line
    {
        'akinsho/bufferline.nvim',
        config = function()
            require('plugins.configs.bufferline').setup()
        end,
        branch = "main",
        event = "BufWinEnter",
    },

    -- bottom line
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

    -- Theme
    { "navarasu/onedark.nvim" },
    { 'EdenEast/nightfox.nvim' },
    { 'folke/tokyonight.nvim' },

    {'ap/vim-css-color'},
}

return M
