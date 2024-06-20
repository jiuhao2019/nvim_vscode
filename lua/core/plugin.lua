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
    "godlygeek/tabular",
	{
		"mbbill/undotree",
		lazy = true,
		cmd = { "UndotreeToggle" },
		keys = {
			{ "<F5>", "<esc>:UndotreeToggle<CR>", desc = "toggle undotree" },
		},
	},
	"lfv89/vim-interestingwords",
	{
		"vim-autoformat/vim-autoformat",
		lazy = true,
		cmd = { "Autoformat" },
		keys = {
			{ "<leader>a", "<esc>:Autoformat<CR>", desc = "autoformat" },
		},
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		ops = {
			keys = "etovxqpdygfblzhckisuran",
		},
		lazy = true,
		cmd = { "HopChar1MW" },
		keys = {
			{ "<leader>h", "<esc>:HopChar1MW<CR>", desc = "hop" },
		},
		config = function()
			require("hop").setup()
		end,
	},
	{
		"chrisbra/vim-diff-enhanced",
		config = function()
			vim.cmd([[
            set diffopt+=internal,algorithm:patience
            ]])
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
})
