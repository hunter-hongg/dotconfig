-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
		{
			"Bekaboo/dropbar.nvim",
			-- optional, but required for fuzzy finder support
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			config = function()
				local dropbar_api = require("dropbar.api")
				vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
				vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
				vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
			end,
		},
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
	git = {
		timeout = 30000,
	},
})
