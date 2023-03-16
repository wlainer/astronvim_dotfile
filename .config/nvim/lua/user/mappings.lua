local buffer_utils = require "astronvim.utils.buffer"
local utils = require "user.utils"

-- Here is a utility function that closes any floating windows when you press escape
local function close_floating()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then vim.api.nvim_win_close(win, false) end
  end
end
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<esc>"] = {
      function()
        close_floating()
        vim.cmd ":noh"
      end,
    },

    -- Debugging
    ["<leader>ll"] = {
      desc = "󰇥 Logsitter",
      function() require("logsitter").log() end,
    },

    -- Search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    ["<leader>s"] = { name = "󰛔 Search/Replace" },

    -- Buffers
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() buffer_utils.nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() buffer_utils.nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- Trouble (see astrocommunity on GitHub for keymaps)
    ["<leader>x"] = { name = "裂Trouble" },
    ["<leader>xt"] = { "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble LSP" },

    -- resize with arrows
    ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = " Zen Mode" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Overseer (task runner)
    ["<leader>o"] = { desc = "Overseer" },
    ["<leader>or"] = {
      "<cmd>OverseerRun<cr>",
      desc = "Run task",
    },

    -- refactoring
    -- ["<leader>lF"] = {
    --   function() require("telescope").extensions.refactoring.refactors() end,
    --   desc = "Refactor"
    -- },

    -- Leap (motion)
    s = {
      function()
        local current_window = vim.fn.win_getid()
        require("leap").leap { target_windows = { current_window } }
      end,
      desc = "Leap",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
