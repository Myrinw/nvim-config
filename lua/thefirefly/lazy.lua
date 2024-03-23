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


require("lazy").setup({
	{ 
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.6', 
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000 
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate"
	},
	{
    		"nvim-neo-tree/neo-tree.nvim",
    		branch = "v3.x",
    		dependencies = {
			"nvim-lua/plenary.nvim",
      			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
      			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    	},
}
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require("telescope.builtin");
vim.keymap.set('n', '<C-p>', builtin.find_files, {})


vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal<CR>')

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = { "lua", "javascript", "php"},
	highlight = {
		enable = true
	},
	indent = { enable = true }

})
