return {
  "keaising/im-select.nvim",
  enabled = function()
    return vim.fn.has("mac") == 1
  end,
  config = function()
    require("im_select").setup({})
  end,
}
