-- TODO: Combine all of these quickfix components into one, similar to
-- the builtin "on_output_quickfix" one, but with better parameters.
-- Specifically, we should be able to close based on exit status, not just
-- whether errorformat matches.

local overseer = require("overseer")
local STATUS = overseer.constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = "Close quickfix list on task success",
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    return {
      on_complete = function(self, task, status, result)
        if status == STATUS.SUCCESS then
          vim.cmd("cclose")
        end
      end,
    }
  end,
}
