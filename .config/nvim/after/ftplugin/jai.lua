vim.lsp.start({
  name = "jai",
  cmd = { "jails", "-jai_path", os.getenv("HOME") .. "/.local/share/jai" },
  root_dir = vim.fn.getcwd(),
})
