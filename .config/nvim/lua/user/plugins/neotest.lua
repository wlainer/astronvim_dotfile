local prefix = "<leader>T"

return {
  "nvim-neotest/neotest",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      -- your neotest config here
      adapters = {
        require "neotest-jest" {
          jestCommand = "npm test --",
        },
      },
    }
  end,
  ft = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  dependencies = {
    "haydenmeade/neotest-jest",
  },
  keys = {
    { prefix, desc = "Test" },
    { prefix .. "n", function() require("neotest").run.run() end, desc = "Run nearest" },
    { prefix .. "f", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run file" },
    { prefix .. "l", function() require("neotest").run.run_last() end, desc = "Run last" },
    { prefix .. "s", function() require("neotest").summary.toggle() end, desc = "Summary" },
    { prefix .. "o", function() require("neotest").output.open { enter = true } end, desc = "Output" },
  },
}
