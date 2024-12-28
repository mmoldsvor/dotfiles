local opts = { noremap = true }
vim.keymap.set("n", "<leader>v", require("fzf-lua").files, opts)
vim.keymap.set("n", "<leader>vw", function() require("fzf-lua").files({ query = vim.fn.expand("<cword>") }) end, opts)
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, opts)
vim.keymap.set("n", "<leader>g", require"fzf-lua".grep_project, opts)
vim.keymap.set("n", "<leader>gw", require"fzf-lua".grep_cword, opts)
vim.keymap.set("n", "<leader>G", require"fzf-lua".grep, opts)
vim.keymap.set("n", "<leader>p", require"fzf-lua".registers, opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

vim.keymap.set("n", "<ESC>",
  function()
    vim.cmd.nohlsearch()
    vim.cmd.echo()
    require("nvim-tree.api").tree.close()
  end,
  { desc = "Clear" }
)

local opts = { noremap=true, silent=true }
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
