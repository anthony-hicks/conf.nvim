---@type overseer.TemplateDefinition
return {
  name = "Build Project",
  params = {
    build_type = {
      name = "Build Type",
      type = "enum",
      choices = { "Debug", "Release", "RelWithDebInfo" },
    },
    sanitizer = {
      name = "Sanitizer",
      type = "enum",
      choices = { "ASan", "UBSan", "TSan" },
      optional = true,
    },
    args = {
      name = "Args",
      optional = true,
    },
  },
  builder = function(params)
    local args = {}

    if params.sanitizer then
      table.insert(args, string.lower(params.sanitizer))
    end

    if params.build_type then
      table.insert(args, "CMAKE_BUILD_TYPE=" .. params.build_type)
    end

    if params.args then
      table.insert(args, params.args)
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
          open_first_item = false, -- Temporary until we fix the categorization problem
        },
        {
          "ahicks.quickfix",
          close_on_status = "always",
        },
      },
    }
  end,
}
