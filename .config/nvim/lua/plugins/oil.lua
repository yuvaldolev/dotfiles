return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    config = function(_)
      require("oil").setup()
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Start Oil in the current directory" },
    }
  },
}
