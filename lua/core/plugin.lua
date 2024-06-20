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
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	},
    "godlygeek/tabular",
	{
		"lambdalisue/fern.vim",
		lazy = true,
		cmd = { "Fern" },
		keys = {
			{ "<leader>e", "<esc>:Fern . -drawer -reveal=% -toggle -width=45<CR>", desc = "toggle fern" },
		},
	},
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
	-- fzf-lua
	{
		"junegunn/fzf",
		build = "./install --bin",
	},
	{
		"ibhagwan/fzf-lua",
		lazy = true,
		cmd = { "FzfLua" },
		keys = {
			{ "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", desc = "find file" },
			{ "<leader>r", "<cmd>lua require('fzf-lua').oldfiles()<CR>", desc = "recent file" },
			{ '<leader>"', "<cmd>lua require('fzf-lua').registers()<CR>", desc = "registers" },
			{ "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "buffers" },
			{ "<leader>m", "<cmd>lua require('fzf-lua').marks()<CR>", desc = "marks" },
		},
		config = function()
			require("fzf-lua").setup({})
		end,
	},
	-- ------------------------------------
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
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
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
		},
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		cmd = { "Spectre" },
		keys = {
			{ "<leader>st", "<esc><cmd>lua require('spectre').toggle()<CR>", desc = "toggle spectre" },
			{ "<leader>ss", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "search word" },
		},
		config = function()
			require("spectre").setup({})
		end,
	},
    {
      "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
              vim.o.timeout = true
              vim.o.timeoutlen = 300
              end,
        opts = {
             -- your configuration comes here
             -- or leave it empty to use the default settings
             -- refer to the configuration section below
                }
     },
     { 
       "preservim/tagbar", 
		cmd = { "TagbarToggle" },
		keys = {
			{ "<leader>tt", "<esc><cmd>TagbarToggle<CR>", desc = "toggle tagbar" },
		},
		config = function()
		end,
     }
})
