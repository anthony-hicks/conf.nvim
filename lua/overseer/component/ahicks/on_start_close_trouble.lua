local trouble = require("trouble")

---@type overseer.ComponentFileDefinition
return {
  desc = "Close Trouble.nvim on task start",
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    return {
      on_start = function(self, task)
          trouble.close()
      end,
    }
  end,
}
