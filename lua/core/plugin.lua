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
	"lfv89/vim-interestingwords",
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
	{
	    "lambdalisue/fern.vim",
		cmd = { "FernToggle" },
		keys = {
			{ "<leader>e", "<esc>:Fern . -drawer -reveal=% -toggle -width=45<CR>", desc = "FernToggle" },
		},
		config = function()
			vim.cmd([[
                let g:loaded_netrw             = 1
                let g:loaded_netrwPlugin       = 1
                let g:loaded_netrwSettings     = 1
                let g:loaded_netrwFileHandlers = 1
                function! s:hijack_directory() abort
                    let path = expand('%:p')
                    if !isdirectory(path)
                        return
                    endif
                    bwipeout % execute printf('Fern %s', fnameescape(path))
                endfunction
                let g:fern#disable_default_mappings = 1
                function! FernInit() abort
                    nmap <buffer><expr>
                    \ <Plug>(fern-my-open-expand-collapse)
                    \ fern#smart#leaf(
                    \   "\<Plug>(fern-action-open:select)",
                    \   "\<Plug>(fern-action-expand)",
                    \   "\<Plug>(fern-action-collapse)",
                    \ )
                    nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
                    nmap <buffer> e <Plug>(fern-action-new-path)
                    nmap <buffer> d <Plug>(fern-action-remove)
                    nmap <buffer> r <Plug>(fern-action-rename)
                    nmap <buffer> H <Plug>(fern-action-hidden:toggle)
                    nmap <buffer> R <Plug>(fern-action-reload)
                    nmap <buffer> h <Plug>(fern-action-open:split)
                    nmap <buffer> v <Plug>(fern-action-open:vsplit)
                    nmap <buffer><nowait> < <Plug>(fern-action-leave)
                    nmap <buffer><nowait> > <Plug>(fern-action-enter)
                endfunction
                augroup FernGroup
                    autocmd!
                    autocmd FileType fern call FernInit()
                augroup END
            ]])
		end,
	},
	{
	    "mbbill/undotree",
		cmd = { "UndotreeToggle" },
		keys = {
			{ "<leader>u", "<esc>:UndotreeToggle<CR>", desc = "UndotreeToggle" },
		},
        config = function()
            vim.cmd([[
            if has("persistent_undo")
                let target_path = expand('~/.undodir')
                if !isdirectory(target_path)
                    call mkdir(target_path, "p", 0700)
                endif
                let &undodir=target_path
                set undofile
            endif
            let g:undotree_WindowLayout = 2
            ]])
        end,
	},
	    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
	    config = function()
	    	require("catppuccin").setup()
	    end,
    },
})

vim.cmd.colorscheme "catppuccin-macchiato"
