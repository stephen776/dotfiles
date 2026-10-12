return {
  "christoomey/vim-tmux-navigator",
  cond = vim.env.HERDR_ENV ~= "1", -- Herdr supplies pane navigation inside its sessions.
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-m>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-n>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-e>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-i>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
