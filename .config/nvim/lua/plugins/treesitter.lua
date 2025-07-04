return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      -- parser_config.jai = {
      --   install_info = {
      --     url = "https://github.com/SogoCZE/tree-sitter-jai.git",
      --     files = {"src/parser.c"},
      --     branch = "main",
      --     requires_generate_from_grammar = false,
      --   },
      -- }
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
