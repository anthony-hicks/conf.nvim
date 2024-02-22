local overseer = require("overseer")
local Status = overseer.constants.STATUS

---@type overseer.ComponentFileDefinition
return {
  desc = "Send task output to quickfix list",
  params = {
    close_on_status = {
      desc = "Close the quickfix list on task complete",
      type = "enum",
      choices = { "always", "never", "success" },
      default = "never",
    },
  },
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    local c = {}

    c.on_complete = function(self, task, status, result)
      if
        params.close_on_status == "always"
        or (params.close_on_status == "success" and status == Status.SUCCESS)
      then
        vim.cmd("cclose")
      end
    end

    return c
  end,
}
