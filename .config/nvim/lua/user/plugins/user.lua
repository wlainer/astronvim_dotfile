return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- Text manipulation --
  {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup() end,
    event = "User Astrofile",
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "User Astrofile",
    config = function() require("lsp_signature").setup() end,
  },
}
