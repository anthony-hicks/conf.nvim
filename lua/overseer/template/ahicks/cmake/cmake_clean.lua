---@type overseer.TemplateDefinition
return {
  name = "CMake Clean",
  builder = function()
    ---@type overseer.TaskDefinition
    return {
      cmd = { "rm" },
      args = { "-rfv", "build" },
      components = {
        "default",
        {
          "on_output_quickfix",
          open = true,
          open_height = 8,
        },
        {
          "ahicks.quickfix",
          close = "success",
        },
      },
    }
  end,
}
