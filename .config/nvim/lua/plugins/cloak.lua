return {
  {
    "laytan/cloak.nvim",
    event = {
      "BufNewFile .env*",
      "BufNewFile wrangler.toml",
      "BufNewFile .dev.vars",
      "BufNewFile .smbcredentials",
      "BufReadPost .env*",
      "BufReadPost wrangler.toml",
      "BufReadPost .dev.vars",
      "BufReadPost .smbcredentials",
    },
    opts = {
      enabled = true,
      cloak_character = "*",
      highlight_group = "Comment",
      patterns = {
        {
          file_pattern = {
            ".env*",
            "wrangler.toml",
            ".dev.vars",
            ".smbcredentials",
          },
          cloak_pattern = "=.+"
        },
      },
    },
  },
}
