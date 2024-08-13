return {
	"chrisbra/vim-diff-enhanced",
	config = function()
		vim.cmd([[
		   set diffopt+=internal,algorithm:patience
		]])
	end,
}
