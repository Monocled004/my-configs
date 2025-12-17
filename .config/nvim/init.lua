
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true        -- line numbers
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin",
  config = function()
    -- load your theme file
    require("plugins.catppuccin")
  end },

  -- Leader key helper
  { "folke/which-key.nvim", config = function()
    require("plugins.which-key")
  end },

  -- Telescope for fuzzy finding
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function()
    require("plugins.telescope")
  end },

  -- File explorer
  { "nvim-tree/nvim-tree.lua" },

  -- Statusline
  { "nvim-lualine/lualine.nvim" , config = function()
    require("plugins.lualine")
  end },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git integration
  { "lewis6991/gitsigns.nvim" },

  -- LSP support
  { "neovim/nvim-lspconfig", config = function()
    require("plugins.lspconfig")
  end },

  -- Completion
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" } },

  -- DashBoard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        require("plugins.dashboard")
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

{
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end
},
{
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "pyright", "tsserver", "clangd" }
    }
  end
}


})

