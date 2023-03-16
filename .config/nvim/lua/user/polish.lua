-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  require "user.autocmds"
  -- Set up custom filetypes
  vim.filetype.add {
    -- extension = {
    --   foo = "fooscript",
    -- },
    filename = {
      ["Fastfile"] = "ruby",
      ["Podfile"] = "ruby",
    },
    -- pattern = {
    --   ["~/%.config/foo/.*"] = "fooscript",
    -- },
  }
end
