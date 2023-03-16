return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar", enabled = false }, -- task runner
  { import = "astrocommunity.code-runner.overseer-nvim" }, -- task runner
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = false },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.refactoring-nvim", enabled = false },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.pack.bash", enabled = true },
  { import = "astrocommunity.pack.json", enabled = true },
  { import = "astrocommunity.pack.lua", enabled = true },
  { import = "astrocommunity.pack.typescript", enabled = true },
  { import = "astrocommunity.pack.yaml", enabled = true },
  { import = "astrocommunity.project.nvim-spectre" }, -- find / replace
  { import = "astrocommunity.syntax.hlargs-nvim" }, -- find / replace
  { import = "astrocommunity.terminal-integration/flatten-nvim" }, -- find / replace
}
