return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = {
        "filesystem",
      },
      add_blank_line_top = false,
      hide_root_node = true,
      retain_hidden_root_indent = true,
      enable_git_status = false,
      source_selector = {
        winbar = false,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      git_status_async = false,
    },
  },
}
