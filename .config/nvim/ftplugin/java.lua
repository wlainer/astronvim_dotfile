vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local config = astronvim.lsp.server_settings("jdtls")

if config.root_dir and config.root_dir ~= "" then
  config["on_attach"] = function(client, bufnr)
    if client.name == "jdt.ls" then
      vim.lsp.codelens.refresh()
      require("jdtls.dap").setup_dap_main_class_configs()
      astronvim.lsp.on_attach(client, bufnr)
    end -- astronvim.lsp.on_attach(client, bufnr)
  end

  require("jdtls").start_or_attach(config)
  require("jdtls").setup_dap({ hotcodereplace = "auto" })

  vim.cmd(
    "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
  )
  vim.cmd(
    "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
  )
  vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
  -- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
  vim.cmd("command! -buffer JdtBytecode lua require('jdtls').javap()")
  -- vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local mappings = {
    L = {
      name = "Java",
      o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
      v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
      c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
      t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
      T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
      C = { "<Cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>", "Setup Main Clas Configs" },
      u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
    },
  }

  local vmappings = {
    L = {
      name = "Java",
      v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
      c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
      m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
    },
  }

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
end
