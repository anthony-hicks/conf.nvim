local overseer = require("overseer")
local trouble = require("trouble")

---@type overseer.ComponentFileDefinition
return {
  desc = "Open Trouble.nvim on task failure",
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    return {
      on_complete = function(self, task, status, result)
        if status == overseer.constants.STATUS.FAILURE then
          trouble.open("quickfix")
          trouble.next({ first = true, skip_groups = true, jump = true })
        end
      end,
    }
  end,
}
