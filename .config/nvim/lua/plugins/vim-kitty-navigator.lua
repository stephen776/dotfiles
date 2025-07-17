return {
  "knubie/vim-kitty-navigator",
  build = "cp ./*.py ~/.config/kitty/",
  enabled = true,
  keys = {
    {
      "<C-m>",
      "<cmd>KittyNavigateLeft<cr>",
      desc = "Navigate window left",
    },
    {
      "<C-n>",
      "<cmd>KittyNavigateDown<cr>",
      desc = "Navigate window down",
    },
    {
      "<C-e>",
      "<cmd>KittyNavigateUp<cr>",
      desc = "Navigate window up",
    },
    {
      "<C-i>",
      "<cmd>KittyNavigateRight<cr>",
      desc = "Navigate window right",
    },
    {
      "<C-h>",
      "<cmd>KittyNavigateLeft<cr>",
      desc = "Navigate window left",
    },
    {
      "<C-j>",
      "<cmd>KittyNavigateDown<cr>",
      desc = "Navigate window down",
    },
    {
      "<C-k>",
      "<cmd>KittyNavigateUp<cr>",
      desc = "Navigate window up",
    },
    {
      "<C-l>",
      "<cmd>KittyNavigateRight<cr>",
      desc = "Navigate window right",
    },
  },
}
