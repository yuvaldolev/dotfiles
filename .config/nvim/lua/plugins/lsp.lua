return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = {"BufReadPre", "BufNewFile"},
    cmd = "Mason",
    dependencies = {
      "folke/neoconf.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
    },
    config = function()
      local neoconf = require("neoconf")
      neoconf.setup({})

      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function()
          if nil ~= vim.diagnostic.get_prev() then
            vim.diagnostic.goto_prev()
            vim.api.nvim_feedkeys("zzzv", "n", true)
          end
        end, opts)
        vim.keymap.set("n", "]d", function()
          if nil ~= vim.diagnostic.get_next() then
            vim.diagnostic.goto_next()
            vim.api.nvim_feedkeys("zzzv", "n", true)
          end
        end, opts)
        vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.diagnostic.config({
          virtual_text = true,
        })
      end)

      local cmp = require("cmp")
      cmp.setup({
        completion = {
          autocomplete = false,
        },
      })

      local fidget = require("fidget")
      fidget.setup({})

      local mason = require("mason")
      mason.setup({})

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {"lua_ls", "tsserver", "rust_analyzer"},
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })
    end,
  },
}
