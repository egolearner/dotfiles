-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.o.fileencodings = "utf-8,ucs-bom,gb2312,gbk,gb18030"
vim.o.encoding = "utf-8"
vim.o.statuscolumn = "%s %l %r"
vim.o.clipboard = ""

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

local function check_and_change_dir(target_dir, up_levels)
  local sep = package.config:sub(1, 1)
  local current_dir = vim.fn.getcwd()
  local target_path = current_dir .. sep .. target_dir
  if vim.fn.isdirectory(target_path) == 1 then
    local cmd = "cd " .. string.rep(".." .. sep, up_levels or 1)
    vim.cmd(cmd)
  end
end

-- 使用示例：检查 CMakeFiles 并切换到父目录
check_and_change_dir("CMakeFiles", 1)
