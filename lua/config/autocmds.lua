-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for C/C++ files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Disable <tab> jumping back to previous snippets
-- after we've already left insert mode
local luasnip = require("luasnip")

local unlinkgrp =
  vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = unlinkgrp,
  pattern = { "s:n", "i:*" },
  desc = "Forget the current snippet when leaving the insert mode",
  callback = function(evt)
    if
      luasnip.session
      and luasnip.session.current_nodes[evt.buf]
      and not luasnip.session.jump_active
    then
      luasnip.unlink_current()
    end
  end,
})
