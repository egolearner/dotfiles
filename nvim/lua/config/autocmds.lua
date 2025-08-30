-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("no_autoformat"),
  pattern = {
    "proto",
    "python",
    "sh",
  },
  callback = function(event)
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("sleep 50m")
  end,
})

vim.api.nvim_create_autocmd({ "SwapExists" }, {
  callback = function()
    vim.v.swapchoice = "o"
  end,
})
