return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lspconfig").verible.setup {
        cmd = {
          'verible-verilog-ls',
          '--rules=+line-length=length:200,-unpacked-dimensions-range-ordering,-explicit-parameter-storage-type,-parameter-name-style',
          '--wrap_spaces=2',
          '--assignment_statement_alignment=align',
          '--case_items_alignment=align',
          '--class_member_variable_alignment=align',
          '--compact_indexing_and_selections=true',
          '--distribution_items_alignment=align',
          '--enum_assignment_statement_alignment=align',
          '--expand_coverpoints=true',
          '--formal_parameters_alignment=align',
          '--formal_parameters_indentation=indent',
          '--module_net_variable_alignment=align',
          '--named_parameter_alignment=align',
          '--named_parameter_indentation=indent',
          '--named_port_alignment=align',
          '--named_port_indentation=indent',
          '--port_declarations_alignment=align',
          '--port_declarations_indentation=indent',
          '--port_declarations_right_align_packed_dimensions=true',
          '--port_declarations_right_align_unpacked_dimensions=true',
          '--struct_union_members_alignment=align',
          '--try_wrap_long_lines=false',
        },
        tagfunc = true,
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          local opts = { noremap=true, silent=true, buffer=bufnr }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
        end
      }
    end,
  },
}
