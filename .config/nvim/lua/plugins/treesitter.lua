return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup {
        ensure_installed = { "c", "cpp", "python", "lua", "vimdoc", "vim", "bash", "verilog", "query" },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        textobjects = { enable = true },
      }

      require("nvim-treesitter.install").prefer_git = true
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      config = {
        systemverilog = "// %s",
        verilog = "// %s",
      },
    },
  }
}
