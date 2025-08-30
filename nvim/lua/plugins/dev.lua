local function file_exists(path)
  return vim.loop.fs_stat(path) ~= nil
end

return {
  { "tyru/open-browser-github.vim", dependencies = { "tyru/open-browser.vim" } },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "iberianpig/tig-explorer.vim", event = "VeryLazy", dependencies = { "rbgrouleff/bclose.vim" } },
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        showMissingFiles = false,
        mappings = {
          "golang",

          -- cpp
          {
            pattern = "(.*).cc$",
            target = "%1.h",
          },
          {
            pattern = "(.*).cc$",
            target = "%1.h",
          },
          {
            pattern = "(.*).cpp$",
            target = "%1.h",
          },
          {
            pattern = "(.*).h$",
            target = {
              {
                target = "%1.cc",
              },
              {
                target = "%1.cpp",
              },
            },
          },

          -- {
          --   pattern = "include/(.*).h$",
          --   target = {
          --     {
          --       target = "src/%1.cc",
          --     },
          --     {
          --       target = "src/%1.cpp",
          --     },
          --   },
          -- },
          -- {
          --   pattern = "src/(.*).cc$",
          --   target = "include/%1.h",
          -- },
          -- {
          --   pattern = "src/(.*).cpp$",
          --   target = "include/%1.h",
          -- },
        },
        transformer = function(buf_path)
          -- 如果路径中包含 /include/，则将其替换为 /src/
          if string.find(buf_path, "/include/") then
            -- 使用 gsub 的第四个参数 1，确保只替换第一个匹配项
            return string.gsub(buf_path, "/include/", "/src/", 1)
          -- 如果路径中包含 /src/，则将其替换为 /include/
          elseif string.find(buf_path, "/src/") then
            return string.gsub(buf_path, "/src/", "/include/", 1)
          end
          -- 如果路径中既不包含 /include/ 也不包含 /src/，则原样返回
          return buf_path
        end,
      })

      vim.cmd([[
        " command! -nargs=* A lua require('other-nvim').open(<f-args>)
        command! -nargs=* A Other <args>
      ]])
    end,
  },
  {
    "cvigilv/esqueleto.nvim",
    config = function()
      require("esqueleto").setup({
        patterns = { "h", "cpp" },
      })
    end,
  },
  {
    "madskjeldgaard/cppman.nvim",
    requires = {
      { "MunifTanjim/nui.nvim" },
    },
    config = function()
      local cppman = require("cppman")
      cppman.setup()

      -- Make a keymap to open the word under cursor in CPPman
      vim.keymap.set("n", "<leader>ccm", function()
        cppman.open_cppman_for(vim.fn.expand("<cword>"))
      end)

      -- Open search box
      vim.keymap.set("n", "<leader>ccc", function()
        cppman.input()
      end)
    end,
  },
  { "sindrets/diffview.nvim" },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
        post_open_hook = function(bufnr, _)
          vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "q",
            "<cmd>lua require('goto-preview').close_all_win()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
        end,
      })
    end,
  },
}
