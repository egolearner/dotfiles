-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap
map.set("n", ";", ":", { noremap = true })
map.set("n", "<leader>q", ":qa<CR>", { noremap = true })
map.set("v", "cc", '"+y', { noremap = true })
