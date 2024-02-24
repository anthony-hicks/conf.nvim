-- Customized descriptions for better clarity.
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    textobjects = {
      move = {
        goto_next_start = {
          ["]f"] = {
            query = "@function.outer",
            desc = "Next function",
          },
          ["]c"] = {
            query = "@class.outer",
            desc = "Next class",
          },
        },
        goto_next_end = {
          ["]F"] = {
            query = "@function.outer",
            desc = "Next function (end)",
          },
          ["]C"] = {
            query = "@class.outer",
            desc = "Next class (end)",
          },
        },
        goto_previous_start = {
          ["[f"] = {
            query = "@function.outer",
            desc = "Prev function",
          },
          ["[c"] = {
            query = "@class.outer",
            desc = "Prev class",
          },
        },
        goto_previous_end = {
          ["[F"] = {
            query = "@function.outer",
            desc = "Prev function (end)",
          },
          ["[C"] = {
            query = "@class.outer",
            desc = "Prev class (end)",
          },
        },
      },
    },
  },
}
