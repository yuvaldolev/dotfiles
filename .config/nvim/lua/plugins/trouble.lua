return {
    {
        "folke/trouble.nvim",
        opts = {},
        event = {"BufReadPre", "BufNewFile"},
        keys = {
          {
            "<leader>t",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Toggle Trouble",
          },
          {
            "]t",
            "<cmd>Trouble diagnostics next skip_groups=true jump=true<cr>",
            desc = "Next Trouble diagnostic",
          },
          {
            "[t",
            "<cmd>Trouble diagnostics prev skip_groups=true jump=true<cr>",
            desc = "Previous Trouble diagnostic",
          },
        },
    },
}
