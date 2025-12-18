return {
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude Code" },
      { "<leader>cC", "<cmd>ClaudeCodeContinue<CR>", desc = "Claude Code continue" },
      { "<leader>cr", "<cmd>ClaudeCodeResume<CR>", desc = "Claude Code resume" },
    },
    cmd = { "ClaudeCode", "ClaudeCodeContinue", "ClaudeCodeResume" },
    config = function()
      require("claude-code").setup({
        window = {
          split_ratio = 0.4,
          position = "botright", -- botright, topleft, or float
          enter_insert = true,
          hide_numbers = true,
          hide_signcolumn = true,
        },
        git = {
          use_git_root = true,
        },
        refresh = {
          enable = true,
          updatetime = 100,
        },
      })
    end,
  },
}
