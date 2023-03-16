-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = { "lua_ls", "tsserver", "bashls" },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      automatic_setup = true,
      ensure_installed = { "prettierd", "eslint_d", "stylua", "luacheck", "cspell", "shfmt" },
    },
    config = function(_, opts)
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      local userUtils = require "user.utils"
      mason_null_ls.setup(opts)
      mason_null_ls.setup_handlers {
        eslint_d = function()
          -- Enable eslint_d for formatting, diagnostics, and code_actions IF the root has an eslint config
          null_ls.register(null_ls.builtins.formatting.eslint_d.with {
            condition = userUtils.has_eslint_config,
          })
          null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
            condition = userUtils.has_eslint_config,
          })
          null_ls.register(null_ls.builtins.code_actions.eslint_d.with {
            condition = userUtils.has_eslint_config,
          })
        end,
        prettierd = function()
          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            condition = userUtils.has_prettier_config,
          })
        end,
        cspell = function()
          null_ls.register(null_ls.builtins.diagnostics.cspell.with {
            diagnostics_postprocess = function(diagnostic) diagnostic.severity = vim.diagnostic.severity["HINT"] end,
          })
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "chrome", "node2" },
    },
  },
}
