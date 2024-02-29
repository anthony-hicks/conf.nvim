return {
  "nvim-neorg/neorg",
  lazy = false,
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              nvim = "~/.config/nvim/neorg",
              todo = "~/todo",
            },
            default_workspace = "todo",
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
  keys = {
    { "<leader>nn", "<cmd>Neorg workspace todo<CR>", desc = "Open workspace: todo" },
    { "<leader>nt", "<cmd>Neorg journal today<CR>", desc = "Journal: today" },
    { "<leader>ny", "<cmd>Neorg journal yesterday<CR>", desc = "Journal: yesterday" },
  },
}
