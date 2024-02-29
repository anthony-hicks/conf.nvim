---@type overseer.TemplateDefinition
return {
    name = "Bear",
    builder = function()
      ---@type overseer.TaskDefinition
      return {
        cmd = "rm -rf .cache && rm -f compile_commands.json && bear -- make -j DEBUG=1",
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
