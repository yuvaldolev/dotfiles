return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    config = function(_, opts) 
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = { "BufNewFile", "BufReadPost" },
    opts = {
      ensure_installed = "all",
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    version = false, -- Last release is way too old and doesn't work on Windows.
  }, 
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufNewFile", "BufReadPost" },
    keys = {
      {
        "<leader>c",
        function()
          require("treesitter-context").go_to_context()
        end,
        desc = "Go to context",
        silent = true,
      },
    },
    opts = {
      enable = true,
    },
  }
}
