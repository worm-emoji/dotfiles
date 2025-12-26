local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Clipboard (use OSC 52 for SSH support)
opt.clipboard = "unnamedplus"

-- Enable OSC 52 clipboard provider (works over SSH in tmux)
-- Requires Neovim 0.10+ and a terminal that supports OSC 52
if vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

-- Mouse
opt.mouse = "a"

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.signcolumn = "yes"
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Backup/swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.cache/nvim/undo")

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Misc
opt.wrap = false
opt.showmode = false
opt.backspace = { "indent", "eol", "start" }

-- Auto-reload files changed externally
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
  desc = "Check for external file changes",
})

-- Terminal mode: use Esc to exit to normal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
