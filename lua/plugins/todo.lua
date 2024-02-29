return {
    "folke/todo-comments.nvim",
    opts = {
      highlight = {
        before = "",
        keyword = "wide_fg",
        after = "fg",
        pattern = { [[.*<(KEYWORDS)\s*:]], [[.*<(KEYWORDS)(.*):]] },
      },
      search = {
        pattern = [[\b(KEYWORDS):|\b(KEYWORDS)(.*):]],
      },
    },
  }
