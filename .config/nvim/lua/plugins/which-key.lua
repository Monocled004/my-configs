local wk = require("which-key")

-- Define window navigation keymaps using leader+w
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wc', '<C-w>c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', ':q<CR>', { noremap = true, silent = true })

wk.add({
  { "<leader>b", group = "buffer" },
  { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Switch buffer" },
  { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer" },
  { "<leader>bn", "<cmd>enew<cr>", desc = "New buffer" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },

  { "<leader>f", group = "file" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
  { "<leader>fs", "<cmd>w<cr>", desc = "Save file" },
  { "<leader>fS", "<cmd>wa<cr>", desc = "Save all" },

  { "<leader>w", group = "window" },
  { "<leader>wh", "<C-w>h", desc = "Move to Window left"},
  { "<leader>wj", "<C-w>j", desc = "Move to Window down"},
  { "<leader>wk", "<C-w>k", desc = "Move to Window up"},
  { "<leader>wl", "<C-w>l", desc = "Move to Window right"},
  { "<leader>wq", "q<Cr>", desc = "Quit Window"},
  { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical split" },
  { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal split" },
  { "<leader>wo", "<cmd>only<cr>", desc = "Close others" },
  { "<leader>wc", "<cmd>close<cr>", desc = "Close window" },

  { "<leader>g", group = "git" },
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },

  { "<leader>p", group = "project" },
  { "<leader>pf", "<cmd>Telescope git_files<cr>", desc = "Find project file" },
  { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Search in project" },

  { "<leader>q", group = "quit" },
  { "<leader>qq", "<cmd>q<cr>", desc = "Quit" },
  { "<leader>qQ", "<cmd>qa<cr>", desc = "Quit all" },
})

