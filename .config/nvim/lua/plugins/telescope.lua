require("telescope").setup {
  defaults = {
    -- show hidden files
    file_ignore_patterns = { "node_modules", ".git/", ".julia", "R", "quicklisp", ".vscode" },
    hidden = true,
  },
  pickers = {
    find_files = {
      -- Use `find` to include hidden files and exclude unwanted directories
      find_command = {
        "find", ".", "!", "-path", "./.git/*",  -- Exclude .git
        "!", "-path", "./.npm/*",  -- Exclude npm
        "!", "-path", "./.cache/*",  -- Exclude npm
        "!", "-path", "./snap/*",  -- Exclude snap
        "!", "-path", "./.mozilla/*",  -- Exclude mozilla
        "-type", "f",  -- Search for files
        "-or", "-type", "d",  -- Also search for directories
      },
    },
    live_grep = {
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
  },
}

