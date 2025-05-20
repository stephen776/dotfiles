return {
  "knubie/vim-kitty-navigator",
  build = "cp ./*.py ~/.config/kitty/",
  enabled = true,
  keys = {
    {
      "<C-n>",
      "<cmd>KittyNavigateLeft<cr>",
      desc = "Navigate window left",
    },
    {
      "<C-e>",
      "<cmd>KittyNavigateDown<cr>",
      desc = "Navigate window down",
    },
    {
      "<C-u>",
      "<cmd>KittyNavigateUp<cr>",
      desc = "Navigate window up",
    },
    {
      "<C-i>",
      "<cmd>KittyNavigateRight<cr>",
      desc = "Navigate window right",
    },
  },
}
