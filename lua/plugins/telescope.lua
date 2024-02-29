local builtin = require("telescope.builtin")

return {
  "nvim-telescope/telescope.nvim",
  -- opts = {
  --   defaults = {
  --     layout_strategy = "vertical",
  --   },
  -- },
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
  },
}
