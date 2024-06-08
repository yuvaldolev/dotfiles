return {
  {
    "sbdchd/neoformat",
    event = { "BufNewFile", "BufReadPost" },
    init = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        command = "try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry",
      })

      vim.g.neoformat_try_node_exe = 1
    end
  },
}
