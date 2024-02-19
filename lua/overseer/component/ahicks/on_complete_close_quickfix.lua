---@type overseer.ComponentFileDefinition
return {
  desc = "Close quickfix list on task complete",
  constructor = function(params)
    ---@type overseer.ComponentSkeleton
    return {
      on_complete = function(self, task, status, result)
        vim.cmd("cclose")
      end,
    }
  end,
}
