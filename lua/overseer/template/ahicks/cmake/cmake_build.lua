---@type overseer.TemplateDefinition
return {
  name = "CMake Build",
  builder = function()
    ---@type overseer.TaskDefinition
    return {
      cmd = { "cmake" },
      args = { "--build", "build", "-j" },
      components = {
        "default",
        {
          "on_output_quickfix",
          open = true,
          open_height = 8,
        },
        {
          "ahicks.on_complete_close_quickfix",
        },
        {
          "ahicks.on_failure_open_trouble",
        },
      },
    }
  end,
}
