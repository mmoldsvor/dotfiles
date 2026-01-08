local opts = { noremap = true, silent=true }
vim.keymap.set("n", "<leader>gv", require("fzf-lua").files, opts)
vim.keymap.set("n", "<leader>gV>", function() require("fzf-lua").grep({raw_cmd = [[git status -su | rg "^\s*M" | cut -d ' ' -f3 | xargs rg --hidden --column --line-number --no-heading --color=always  --with-filename -e '']]}) end, opts)
vim.keymap.set("n", "<leader>vw", function() require("fzf-lua").files({ query = vim.fn.expand("<cword>") }) end, opts)
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, opts)
vim.keymap.set("n", "<leader>gg", require"fzf-lua".grep_project, opts)
vim.keymap.set("n", "<leader>gw", require"fzf-lua".grep_cword, opts)
vim.keymap.set("n", "<leader>gG", require"fzf-lua".grep, opts)
vim.keymap.set("n", "<leader>p", require"fzf-lua".registers, opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", opts)
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)

vim.keymap.set("n", "<ESC>",
  function()
    vim.cmd.nohlsearch()
    vim.cmd.echo()
    require("nvim-tree.api").tree.close()
  end,
  { desc = "Clear" }
)

local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>yy", "\"+yy", opts)
vim.keymap.set("n", "<leader>Y", "\"+yg_", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)

vim.keymap.set("n", "<leader>p", "\"+p", opts)
vim.keymap.set("n", "<leader>P", "\"+P", opts)
vim.keymap.set("v", "<leader>p", "\"+p", opts)
vim.keymap.set("v", "<leader>P", "\"+P", opts)


local function find_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and git_root and git_root ~= "" then
    return git_root
  end

  local path = vim.fs.find(".git", { upward = true, type = "directory" })[1]
  return path and vim.fs.dirname(path) or nil
end

vim.keymap.set("n", "<leader>gr", function()
  local root = find_git_root()
  if root then
    print(root)
  else
    print("Not inside a git repo")
  end
end, { desc = "Show git root directory" })
