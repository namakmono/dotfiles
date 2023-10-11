-- base --
-- tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- indent
vim.opt.autoindent = true
vim.opt.smartindent = true
-- other
vim.opt.timeoutlen = 300

-- leader
vim.g.mapleader = ' '

-- keymap --
vim.keymap.set({'v', '!'}, 'kj', '<esc>')
vim.keymap.set({'v', '!'}, 'jk', '<esc>')

-- plugins --
-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

