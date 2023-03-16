local astro_utils = require "astronvim.utils"

local M = {}

function M.quick_notification(msg, type) astronvim.notify(msg, type or "info", { timeout = 0 }) end

function M.has_eslint_config(utils)
  return utils.root_has_file {
    ".eslintrc.json",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc",
  }
end

function M.has_prettier_config(utils)
  return utils.root_has_file {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    "prettier.config.js",
    "prettier.config.cjs",
  }
end

function M.better_search(key)
  return function()
    local searched, error =
      pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    if searched then
      pcall(vim.cmd.normal, "zzzv")
    else
      astro_utils.notify(error)
    end
    vim.opt.hlsearch = searched
  end
end

return M
