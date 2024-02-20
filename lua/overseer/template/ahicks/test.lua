---@type overseer.TemplateDefinition
return {
    name = "Run unit tests",
    builder = function()
      ---@type overseer.TaskDefinition
      return {
        cmd = { "make" },
        args = { "test" },
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
