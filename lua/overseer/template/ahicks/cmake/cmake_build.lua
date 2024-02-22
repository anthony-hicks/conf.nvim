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
          "ahicks.quickfix",
          close_on_status = "always",
        },
        {
          "ahicks.trouble",
          close_on_start = true,
          open_on_status = "failure",
          open_first_item = true,
        },
      },
    }
  end,
}
