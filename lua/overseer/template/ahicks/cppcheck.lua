---@type overseer.TemplateDefinition
return {
    name = "Cppcheck",
    builder = function()
      ---@type overseer.TaskDefinition
      return {
        cmd = { "cppcheck" },
        args = {
          "--project=compile_commands.json",
          "--enable=all",
          "--template=gcc",
          "--quiet",
        },
        strategy = {
          "jobstart",
          use_terminal = false,
        },
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
