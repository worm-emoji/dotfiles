return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Use Node 22 installed via nvm
    vim.g.copilot_node_command = vim.fn.expand("~/.nvm/versions/node/v22.21.1/bin/node")
    -- Disable default Tab mapping to avoid conflict with nvim-cmp
    vim.g.copilot_no_tab_map = true

    -- Use Ctrl-J to accept Copilot suggestions instead
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
      desc = "Accept Copilot suggestion",
    })

    -- Additional keymaps for navigating suggestions
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
    vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
  end,
}
