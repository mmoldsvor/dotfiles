vim.opt.encoding = "UTF-8"
-- Tab options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Cursor options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Split options
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Timeouts
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- Other options
vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.undofile = true
vim.opt.list = true
vim.opt.colorcolumn = "80"

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

require("config.keymaps")
require("config.local")
