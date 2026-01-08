function emacs_command(command_string, is_silent)
  local silent_string = "";
  if (is_silent) then
    silent_string = "silent ";
  end
  local design_dir = vim.fs.root(0, {".git"}) .. "/design";
  if (vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "modified")) then
    print("Buffer is modified");
  elseif (vim.fn.isdirectory(design_dir) == 0) then
    print("ERROR: design directory not found");
  else
    vim.cmd(silent_string .. "!emacs --batch --no-site-file --no-site-lisp" ..
            " -l " .. design_dir .. "/shared/elisp/verilog-mode.el" ..
            " -l " .. design_dir .. "/shared/elisp/verilog-mode-customise.el" ..
            " % -f verilog-mode-customise -f " .. command_string .. " -f save-buffer")
  end
end

vim.keymap.set("n", "<leader>va",
  function()
    emacs_command("verilog-batch-auto", true)
  end,
  { desc = "verilog-mode expand" }
)

vim.keymap.set("n", "<leader>vA",
  function()
    emacs_command("verilog-batch-auto", false)
  end,
  { desc = "verilog-mode expand" }
)

vim.keymap.set("n", "<leader>vd",
  function()
    emacs_command("verilog-batch-delete-auto", true)
  end,
  { desc = "verilog-mode collapse" }
)

vim.keymap.set("n", "<leader>vD",
  function()
    emacs_command("verilog-batch-delete-auto", false)
  end,
  { desc = "verilog-mode collapse" }
)

local function find_sv_from_design(path)
  local git_root = vim.fs.root(0, {".git"})
  if not git_root then
    print("Not in a git repo")
    return
  end

  local base = vim.fs.joinpath(git_root, path)
  local name = vim.fn.expand("<cword>")
  if name == "" then
    print("No word under cursor")
    return
  end

  local results = vim.fs.find(
    function(filename)
      return (filename == name .. ".sv") or
             (filename == name .. ".svh")
    end,
    {path = base, type = "file"}
  )

  if #results > 0 then
    return results[1]
  else
    print("No match for " .. name .. ".sv or " .. name .. ".svh in " .. base)
    return nil
  end
end

vim.keymap.set("n", "<leader>v", function()
  local file = find_sv_from_design("design/src")
  if file then
    vim.cmd.edit(file)
  end
end, { desc = "Open .sv/.svh file under cursor in design/src" })

vim.keymap.set("n", "<leader>g", function()
  local file = find_sv_from_design("verification")
  if file then
    vim.cmd.edit(file)
  end
end, { desc = "Open .sv/.svh file under cursor in verification" })

vim.keymap.set("n", "<leader>V", function()
  local git_root = vim.fs.root(0, {".git"})
  if not git_root then
    print("Not in a git repo")
    return
  end

  local path = "design/src"
  local base = vim.fs.joinpath(git_root, path)
  local name = vim.fn.expand("<cword>")
  if name == "" then
    print("No word under cursor")
    return
  end

  local pat = "^\\s+" .. name .. "\\b"
  require("fzf-lua").live_grep({
    prompt       = name .. " > ",
    search       = pat,
    search_paths = { base },
    no_esc       = true,
  })
end, { desc = "Search for module instantiations under cursor in design/src" })

vim.keymap.set("n", "<leader>G", function()
  local git_root = vim.fs.root(0, {".git"})
  if not git_root then
    print("Not in a git repo")
    return
  end

  local path = "verification"
  local base = vim.fs.joinpath(git_root, path)
  local name = vim.fn.expand("<cword>")
  if name == "" then
    print("No word under cursor")
    return
  end

  local pat = "^\\s+" .. name .. "\\b"
  require("fzf-lua").live_grep({
    prompt       = name .. " > ",
    search       = pat,
    search_paths = { base },
    no_esc       = true,
  })
end, { desc = "Search for module instantiations under cursor in verification" })
