-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = false
vim.g.autoformat = false

-- Merged from ~/dotfiles/.config/nvim
local opt = vim.opt

opt.conceallevel = 0

-- disable animations
vim.g.snacks_animate = false

-- Only run Prettier when the project has a Prettier config file
vim.g.lazyvim_prettier_needs_config = true
