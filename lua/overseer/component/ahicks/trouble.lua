local overseer = require("overseer")
local trouble = require("trouble")
local Status = overseer.constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = ":Trouble quickfix",
  params = {
    close_on_start = {
      desc = "Close Trouble on task start",
      type = "boolean",
      default = true,
    },
    open_on_status = {
      desc = "Open Trouble on task complete",
      type = "enum",
      choices = { "always", "never", "success", "failure" },
    },
    open_first_item = {
      desc = "Open first item when Trouble opens",
      type = "boolean",
      default = true,
    },
  },
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    local c = {}

    if params.close_on_start then
      c.on_start = function(self, task)
        trouble.close()
      end
    end

    -- Conditions inside the function body are more readable than
    -- conditionally defining the function with different bodies.
    c.on_complete = function(self, task, status, result)
      if
        (params.open_on_status == "always")
        or (params.open_on_status == "success" and status == Status.SUCCESS)
        or (params.open_on_status == "failure" and status == Status.FAILURE)
      then
        trouble.open("quickfix")
      end

      if params.open_first_item and status == Status.FAILURE then
        trouble.next({ first = true, skip_groups = true, jump = true })
      end
    end

    return c
  end,
}
