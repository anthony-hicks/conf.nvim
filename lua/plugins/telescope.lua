local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          width = 0.5,
        },
      },
    },
  },
  keys = {
    {
      "<leader>ss",
      function()
        builtin.lsp_document_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
          symbol_width = 55, -- default: 25
        })
      end,
      desc = "[S]earch [S]ymbols (document)",
    },
    {
      "<leader>sS",
      function()
        builtin.lsp_dynamic_workspace_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
          symbol_width = 55,
        })
      end,
      desc = "[S]earch [S]ymbols (workspace)",
    },
    -- When I delete a file, I don't want it to show up in Find Files. LazyVim
    -- uses git_files for this keymap by default, which still shows the deleted
    -- files because they are tracked by Git. But now that we have <leader>fg,
    -- there's no reason to use git_files elsewhere, I'll use it when I want to.
    {
      "<leader>fF",
      "<cmd>Telescope find_files<CR>",
      desc = "[F]ind [F]iles",
    },
  },
}
