return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add a file to Harpoon",
      },
      {
        "<leader>q",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle the Harpoon quick menu",
      },
      {
        "<leader>h",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Navigate to Harpoon file 1",
      },
      {
        "<leader>j",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Navigate to Harpoon file 2",
      },
      {
        "<leader>k",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Navigate to Harpoon file 3",
      },
      {
        "<leader>l",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Navigate to Harpoon file 4",
      },
    },
  },
}
