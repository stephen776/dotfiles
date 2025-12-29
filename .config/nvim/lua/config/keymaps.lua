-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- keep cursor in the middle when half page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<PageDown>", "<C-d>zz")
map("n", "<PageUp>", "<C-u>zz")

-- keep curosr centered when iterating search results
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- clear search highlights
map("n", "<leader>h", ":nohl<CR>")

-- delete single character without copying into register
map("n", "x", '"_x')

-- greatest renmap ever - past over text without overwriting register
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland - yank into system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- ctrl-backspace in insert node to delete whole words
map("i", "<C-BS>", "<Esc>cvb")

-- stop me from accidentally undoing 1000 things
map("n", "u", ":undo<CR>", { noremap = true, silent = true, desc = "Undo last change" })

map("n", "Q", "<nop>")
map("n", "<CR>", "ciw")

-- tmux-sessionizer
map("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux sessionizer" })
