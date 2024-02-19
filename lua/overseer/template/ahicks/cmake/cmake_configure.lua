---@type overseer.TemplateDefinition
return {
  name = "CMake Configure",
  builder = function()
    ---@type overseer.TaskDefinition
    return {
      cmd = { "cmake" },
      args = { "-S", ".", "-B", "build", "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      components = {
        "default",
        {
          "on_output_quickfix",
          open = true,
          open_height = 8,
        },
        {
          "ahicks.on_success_close_quickfix",
        },
      },
    }
  end,
}
