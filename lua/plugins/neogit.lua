return {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    opts = {
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  }
