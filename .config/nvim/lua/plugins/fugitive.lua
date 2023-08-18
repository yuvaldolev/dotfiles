return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    init = function()
      local fugitive_group = vim.api.nvim_create_augroup("Fugitive", {})

      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = fugitive_group,
        pattern = "*",
        callback = function()
          if vim.bo.ft ~= "fugitive" then
            return
          end

          local bufnr = vim.api.nvim_get_current_buf()
          local opts = {buffer = bufnr, remap = false}
          vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
          end, opts)

          -- Always rebase.
          vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
          end, opts)

          -- NOTE: This allows easily setting the branch that's pushed and any tracking
          -- needed if wasn't set up correctly.
          vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
        end,
      })
    end,
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Launch fugitive" }
    },
  },
}
