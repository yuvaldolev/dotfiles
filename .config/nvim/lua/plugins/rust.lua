return {
  {
    "rust-lang/rust.vim",
    event = {
      "BufNewFile *.rs",
      "BufNewFile *.toml",
      "BufReadPost *.rs",
      "BufReadPost *.toml",
    },
  },
}
