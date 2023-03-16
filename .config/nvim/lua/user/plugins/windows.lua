local prefix = "<leader>W"
return {
  "anuvyklack/windows.nvim",
  dependencies = { "anuvyklack/middleclass" },
  config = function() require("windows").setup() end,
  keys = {
    { prefix, desc = "Windows" },
    { prefix .. "m", "<cmd>WindowsMaximize<cr>", desc = "Maximize Window" },
    { prefix .. "_", "<cmd>WindowsMaximizeVertically<cr>", desc = "Maximize Window Vertically" },
    { prefix .. "|", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Maximize Window Horizontally" },
    { prefix .. "=", "<cmd>WindowsEqualize<cr>", desc = "Maximize Equalize" },
  },
}
