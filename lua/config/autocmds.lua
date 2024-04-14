-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "python" },
--   callback = function()
--     vim.opt_local.colorcolumn = "72,88" -- Ruler at column number
--     vim.opt_local.tabstop = 4 -- Number of spaces tabs count for
--     vim.opt_local.shiftwidth = 4 -- Size of an indent
--     print("Python autocmds executed")
--   end,
-- })
--
--

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  pattern = "*.py",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    print("Applying Python settings") -- Debug message
  end,
})

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats like markdown
-- the default conceallevel is 3 in Lazyvim but it can be changed to 0

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript" },
  callback = function()
    vim.opt_local.tabstop = 4 -- number of space tabs count for
    vim.opt_local.shiftwidth = 4 -- size of an indent
  end,
})
