vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.2",
    requires = { {"nvim-lua/plenary.nvim"} },
  }

  use({ "rose-pine/neovim", as = "rose-pine" })

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  use("nvim-treesitter/playground")

  use {
    "ThePrimeagen/harpoon",
    requires = { {"nvim-lua/plenary.nvim"} },
  }

  use("mbbill/undotree")

  use("tpope/vim-fugitive")

  use("nvim-treesitter/nvim-treesitter-context")

  use("laytan/cloak.nvim")

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use("SirVer/ultisnips")

  use("honza/vim-snippets")

  use("rust-lang/rust.vim")

  use("sbdchd/neoformat")
end)
