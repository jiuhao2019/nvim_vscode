vim.cmd([[
    filetype on
    filetype indent on
    filetype plugin on
    syntax on
    set autoread
    set paste
    set confirm
    set tabstop     =4
    set softtabstop =4
    set shiftwidth  =4
    set expandtab
    set autoindent
    set noswapfile
    set nobackup
    set history =10000
    set completeopt=menu,menuone,noselect
    "搜索字符跳转时不循环，要么到底，要么到顶
    set nowrapscan
    "不自动换行
    set nowrap
    set noautochdir
    set shortmess =aIt
    "不要自动生成各种备份文件
    set noswapfile
    set nobackup
    "一直显示底部状态栏,tab栏
    set laststatus =2
    set showtabline =0
    set statusline=%F%m%r%h%w%=\ [%l\/%L:%v]
    set tags=tags;

    function! UpdateCtags()
      let curdir=getcwd()
      while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
          break
        endif
      endwhile
      if filewritable("./tags")
        !rm tags
        !ctags -R  --langmap=c:+.h --languages=c --links=yes --c-kinds=+p --fields=+iaS --extras=+qF
      endif
      execute ":cd " . curdir
    endfunction
 ]])

--  For more options, you can see `:help option-list`
vim.opt.termguicolors = true
vim.opt.number = false
vim.opt.mouse = "a"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 30

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.background = "dark"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = false
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cmdheight = 1
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 1
-- -------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.enable(false)
	end,
})
-- vim: ts=2 sts=2 sw=2 et
