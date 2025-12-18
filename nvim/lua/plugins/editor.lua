return {
  -- Auto pairs
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  -- Surround
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
        },
      })
    end,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },

  -- Better buffer delete
  {
    "famiu/bufdelete.nvim",
    keys = {
      { "<leader>bd", "<cmd>Bdelete<CR>", desc = "Delete buffer" },
      { "<leader>bD", "<cmd>Bdelete!<CR>", desc = "Delete buffer (force)" },
    },
  },

  -- Highlight todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("todo-comments").setup()
    end,
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Search TODOs" },
    },
  },

  -- Better diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Toggle trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix" },
    },
    config = function()
      require("trouble").setup()
    end,
  },

  -- Tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
