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

-- Bootstap hotpot into lazy plugin dir if it does not exist yet.
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
  vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    -- You may with to pin a known version tag with `--branch=vX.Y.Z`
    -- "--branch=v0.9.6", -- disabled to fix an error with lazy.nvim
    "https://github.com/rktjmp/hotpot.nvim.git",
    hotpotpath,
  })
end

-- As per lazy's install instructions, but insert hotpots path at the front
vim.opt.runtimepath:prepend({hotpotpath, lazypath})

require("hotpot")
require("damonkelley.init")
