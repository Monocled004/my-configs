require("telescope").setup {
  defaults = {
    -- show hidden files
    file_ignore_patterns = { "node_modules", ".git/", ".julia", "R", "quicklisp", ".vscode" },
    hidden = true,
  },
  pickers = {
    find_files = {
      -- include hidden files
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
    live_grep = {
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
  },
}

