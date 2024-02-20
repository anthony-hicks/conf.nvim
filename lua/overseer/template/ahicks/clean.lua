---@type overseer.TemplateDefinition
return {
    name = "Clean Project",
    builder = function()
      ---@type overseer.TaskDefinition
      return {
        cmd = { "make" },
        args = { "realclean" },
        components = {
          "default",
          {
            "on_output_quickfix",
            open = true,
            open_height = 12,
          },
          {
            "ahicks.quickfix",
            close = "success",
          },
        },
      }
    end,
  }
