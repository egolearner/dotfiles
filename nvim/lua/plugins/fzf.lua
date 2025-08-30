return {
  {
    "junegunn/fzf.vim",
    keys = {
      { "<C-p>", "<cmd>Files<cr>", desc = "Find Files" },
      -- not working
      -- { "<leader>a", ":Rg<Space>", desc = "Grep Files" },
      -- { "<leader>rg", "<cmd>Rg <C-R><C-W><CR>", desc = "Grep Current Word" },
    },
    event = {
      "VeryLazy",
    },
    enabled = false,
    config = function()
      if vim.fn.executable("rg") == 1 then
        vim.o.grepprg = "rg --vimgrep"
      end
      vim.cmd([[
      if executable('rg')
      let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
      endif
      "nmap <C-p> :Files<CR>
      "nmap <Leader>f :Files<CR>
      "nmap <Leader>F :GFiles<CR>
      "nmap <Leader>b :Buffers<CR>
      "nmap <Leader>h :History<CR>
      "nmap <Leader>tt :BTags<CR>
      "nmap <Leader>TT :Tags<CR>
      "nmap <Leader>l :BLines<CR>
      "nmap <Leader>L :Lines<CR>
      "nmap <Leader>' :Marks<CR>
      nmap <Leader>a :Rg<Space>
      nnoremap <Leader>rg :Rg <C-R><C-W><CR>
      ]])
    end,
    dependencies = { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  },
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<C-p>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
      { "<leader>rg", "<cmd>FzfLua grep_cword<cr>", desc = "search word under cursor" },
      -- not working
      -- { "<leader>a", ":Rg<Space>", desc = "Grep Files" },
      -- { "<leader>rg", "<cmd>Rg <C-R><C-W><CR>", desc = "Grep Current Word" },
    },
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
  },
}
