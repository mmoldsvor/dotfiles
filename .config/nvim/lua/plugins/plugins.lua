return {
  { "mg979/vim-visual-multi" },
  { "echasnovski/mini.surround" },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      ls.setup ({
        keep_roots = true,
        link_roots = true,
        link_children = true,

        -- Update more often, :h events for more info.
        update_events = "TextChanged,TextChangedI",
        -- Snippets aren't automatically removed if their text is deleted.
        -- `delete_check_events` determines on which events (:h events) a check for
        -- deleted snippets is performed.
        -- This can be especially useful when `history` is enabled.
        delete_check_events = "TextChanged",
        -- ft_func = function()
        --   return require("luasnip.extras.filetype_functions").from_cursor(requires 'nvim-treesitter/nvim-treesitter')
        -- end,
        ft_func = function()
          return vim.split(vim.bo.filetype, ".", true)
        end,
      })
      vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.expand() end, { silent = true })
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
      require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})
    end
  }
}
