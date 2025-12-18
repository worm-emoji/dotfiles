return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
          "json",
          "jsonc",
          "html",
          "css",
          "scss",
          "lua",
          "markdown",
          "markdown_inline",
          "yaml",
          "graphql",
          "bash",
          "vim",
          "vimdoc",
          "regex",
          "gitignore",
          "diff",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })
    end,
  },
}
