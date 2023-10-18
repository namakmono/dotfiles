-- base --
-- tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- other
-- 改行コードのデフォルトをUNIX(LF)に指定
-- vim.opt.fileformat = "unix" -- この設定ではwindows環境でunixにならなかった
vim.opt.fileformats = "unix,dos"
-- コマンド待ち時間を短縮
-- (kj同時押し→<esc>のキーマップ導入により、入力モード時のkまたはjの入力時に待ち時間が発生するのを、短縮するため)
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

