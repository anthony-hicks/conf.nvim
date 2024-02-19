local overseer = require("overseer")

---@type overseer.ComponentFileDefinition
return {
  desc = "Open Trouble.nvim on task failure",
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    return {
      on_complete = function(self, task, status, result)
        print("status = \n", status)
        if status == overseer.constants.STATUS.FAILURE then
          local trouble = require("trouble")
          trouble.open("quickfix")
          trouble.next({ skip_groups = true, jump = true })
        end
      end,
    }
  end,
}
