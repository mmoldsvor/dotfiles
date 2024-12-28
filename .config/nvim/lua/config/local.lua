function emacs_command(command_string, is_silent)
  local silent_string = "";
  if (is_silent) then
    silent_string = "silent ";
  end
  local design_dir = vim.fn.getcwd() .. "/design";
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
