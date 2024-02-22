---@type overseer.TemplateDefinition
return {
  name = "Build Project",
  params = {
    build_type = {
      name = "Build Type",
      type = "enum",
      choices = { "Debug", "Release" },
    },
  },
  builder = function(params)
    local args = { "-j" }

    if params.build_type == "Debug" then
      table.insert(args, "DEBUG=1")
    end

    ---@type overseer.TaskDefinition
    return {
      cmd = { "make" },
      args = args,
      strategy = {
        "jobstart",
        use_terminal = false,
      },
      components = {
        "default",
        {
          "on_output_quickfix",
          open = true,
          open_height = 12,
        },
        {
          "ahicks.trouble",
          close_on_start = true,
          open_on_status = "failure",
          open_first_item = true,
        },
        {
          "ahicks.quickfix",
          close_on_status = "always",
        },
      },
    }
  end,
}
