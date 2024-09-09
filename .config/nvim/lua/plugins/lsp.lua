return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    event = {"BufReadPre", "BufNewFile"},
    cmd = "Mason",
    dependencies = {
      "folke/neoconf.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local neoconf = require("neoconf")
      neoconf.setup({})

      local lsp_zero = require("lsp-zero")

      local lsp_attach = function(_, bufnr)
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
      end

      lsp_zero.extend_lspconfig({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        lsp_attach = lsp_attach,
        float_border = "rounded",
        sign_text = true,
      })

      local fidget = require("fidget")
      fidget.setup({})

      local mason = require("mason")
      mason.setup({})

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {"lua_ls", "rust_analyzer", "ts_ls"},
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_action = require("lsp-zero").cmp_action()
      cmp.setup({
        completion = {
          autocomplete = false,
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp_action.luasnip_supertab(),
          ["<C-S-n>"] = cmp_action.luasnip_shift_supertab(),
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
