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
        components = {
          "default",
          {
            "ahicks.on_start_close_trouble",
          },
          {
            "on_output_quickfix",
            open = true,
            open_height = 12,
          },
          {
            "ahicks.quickfix",
            close = "always",
          },
          {
            "ahicks.on_failure_open_trouble",
          },
        },
      }
    end,
  }
