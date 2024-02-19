local overseer = require("overseer")
local STATUS = overseer.constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = "Send task output to quickfix list",
  -- TODO: Separate "live" or "tail" param? Or do we always want to see
  -- the output?
  -- TODO open
  -- TODO height
  params = {
    open = {
      desc = "Open the quickfix list on task output",
      type = "boolean",
      default = false,
    },
    height = {
      desc = "Height of the quickfix list",
      type = "integer",
      optional = true,
      validate = function(v)
        return v > 0
      end,
    },
    close = {
      desc = "Close the quickfix list on task complete",
      type = "enum",
      choices = { "always", "never", "success" },
      default = "never",
    },
  },
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    local c = {}

    if params.close == "always" then
      c.on_complete = function(self, task, status, result)
        vim.cmd("cclose")
      end
    elseif params.close == "success" then
      c.on_complete = function(self, task, status, result)
        if status == STATUS.SUCCESS then
          vim.cmd("cclose")
        end
      end
    end

    return c
  end,
}
