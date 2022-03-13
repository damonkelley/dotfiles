-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/damonkelley/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/damonkelley/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/damonkelley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/damonkelley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/damonkelley/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/npxbr/gruvbox.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nð\4\0\0\6\0\22\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(4)<CR>\14<leader>4\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(3)<CR>\14<leader>3\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(2)<CR>\14<leader>2\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(1)<CR>\14<leader>1\1\0\1\vsilent\0027:lua require('harpoon.ui').toggle_quick_menu()<CR>\15<leader>hm\1\0\1\vsilent\0020:lua require('harpoon.mark').add_file()<CR>\15<leader>ha\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  neogit = {
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n¥\3\0\0\6\0\21\0-6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\18\0'\4\19\0005\5\20\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\19:TestVisit<CR>\15<Leader>tg\1\0\1\vsilent\2\18:TestLast<CR>\15<Leader>tl\1\0\1\vsilent\2\19:TestSuite<CR>\15<Leader>ta\1\0\1\vsilent\2\18:TestFile<CR>\15<Leader>tf\1\0\1\vsilent\2\21:TestNearest<CR>\15<Leader>tn\6n\20nvim_set_keymap\bapi\25test#preserve_screen\6g\bvim\0" },
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-ultest",
    url = "https://github.com/rcarriga/vim-ultest"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/damonkelley/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n¥\3\0\0\6\0\21\0-6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\18\0'\4\19\0005\5\20\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\19:TestVisit<CR>\15<Leader>tg\1\0\1\vsilent\2\18:TestLast<CR>\15<Leader>tl\1\0\1\vsilent\2\19:TestSuite<CR>\15<Leader>ta\1\0\1\vsilent\2\18:TestFile<CR>\15<Leader>tf\1\0\1\vsilent\2\21:TestNearest<CR>\15<Leader>tn\6n\20nvim_set_keymap\bapi\25test#preserve_screen\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nð\4\0\0\6\0\22\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(4)<CR>\14<leader>4\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(3)<CR>\14<leader>3\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(2)<CR>\14<leader>2\1\0\1\vsilent\2/:lua require('harpoon.ui').nav_file(1)<CR>\14<leader>1\1\0\1\vsilent\0027:lua require('harpoon.ui').toggle_quick_menu()<CR>\15<leader>hm\1\0\1\vsilent\0020:lua require('harpoon.mark').add_file()<CR>\15<leader>ha\6n\20nvim_set_keymap\bapi\bvim\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
