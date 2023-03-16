-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    backup = false,
    -- clipboard = "unnamedplus",
    conceallevel = 2, -- enable conceal
    lazyredraw = true,
    number = true, -- sets vim.opt.number
    relativenumber = false, -- sets vim.opt.relativenumber
    -- set to true or false etc.
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    spell = false, -- sets vim.opt.spell
    spelllang = "en_us",
    swapfile = false,
    wildignorecase = true,
    wildignore = "**/node_modules/*,**/.git/*",
    wrap = false, -- sets vim.opt.wrap
  },
  o = {},
  g = {
    catppuccin_flavour = "mocha",
    mapleader = " ", -- sets vim.g.mapleader
    maplocalleader = ",", -- sets vim.g.maplocalleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}
