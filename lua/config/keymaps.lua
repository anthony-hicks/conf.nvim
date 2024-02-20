-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- (kickstart.nvim)
--
-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- User

-- (primeagen) Center on vertical movement
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")

local which_key = require("which-key")
which_key.register({
  ["<leader>n"] = { name = "+Neorg" },
  ["<leader>o"] = { name = "+Overseer" },
  ["<leader>ot"] = { name = "+Task" },
})

local overseer = require("overseer")

-- Build (debug)
vim.keymap.set("n", "gb", function()
  overseer.run_template({
    name = "Build Project",
    params = {
      build_type = "Debug",
    },
  })
end, { desc = "[C++] Build Project" })

-- Open Overseer
vim.keymap.set("n", "<leader>oo", function()
  vim.cmd("OverseerToggle")
end, { desc = "[O]verseer [O]pen" })

-- Stop all running or pending tasks
vim.keymap.set("n", "<leader>os", function()
  local tasks = overseer.list_tasks({ status = { "PENDING", "RUNNING" } })
  for _, task in ipairs(tasks) do
    overseer.run_action(task, "stop")
  end
end, { desc = "[O]verseer [S]top" })

-- Clean
vim.keymap.set("n", "<leader>otc", function()
  overseer.run_template({
    name = "Clean Project",
  })
end, { desc = "[O]verseer [T]ask [C]lean" })

-- Build
vim.keymap.set("n", "<leader>otb", function()
  overseer.run_template({
    name = "Build Project",
  })
end, { desc = "[O]verseer [T]ask [B]uild" })
