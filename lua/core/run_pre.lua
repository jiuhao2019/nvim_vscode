vim.cmd([[
let mapleader = " "
set termguicolors
set background=dark
set autoread
filetype on
filetype indent on
filetype plugin on
syntax on
set shortmess=atI
"disable cursor blink
set gcr+=a:blinkon0
"开启光亮光标行
set cursorline
" hi CursorLine   cterm=NONE ctermbg='Brown' ctermfg='Red' guibg='Brown' guifg='Red'
"开启高亮光标列
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg='Brown' ctermfg='Red' guibg='Brown' guifg='Red'
""回删键有回删键的样子
set backspace=indent,eol,start
"比如当退出而没保存修改时提示确认
set confirm
"tab等于4个空格
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
"换行时缩进模式
set autoindent
set cindent
"不要自动生成各种备份文件
set noswapfile
set nobackup
"高亮被搜索字符
set hlsearch
set history=10000
"一直显示底部状态栏,tab栏
set laststatus=2
set showtabline=0
set statusline=%F%m%r%h%w%=\ [%l\/%L:%v]
set showcmd
"编码模式，避免乱码
set fileencodings =utf-8,cp936,big5,latin1
set encoding      =utf-8
"光标移动时上下屏幕顶底部预留行数
set scrolloff=1
set completeopt=menu,menuone,noselect
"新建窗口出现在右边或下边
set splitright
set splitbelow
"搜索字符跳转时不循环，要么到底，要么到顶
set nowrapscan
"不自动换行
set nowrap
set tw=0
"折叠模式
set nofoldenable
"set foldmethod=indent
"set foldlevelstart=99
"不开启搜索并按行首或行尾部的设置的模式显示,
"比如vim帮助文档底部的格式字符
set nomodeline
"复制粘帖不乱缩进
set paste
"set nu
"set rnu
"keybind超时设置
set notimeout
set ttimeout
set ttimeoutlen=10
set updatetime=100
let g:python3_host_prog = "/usr/bin/python3"
]])
-- -------------------------------------------
vim.cmd([[
set noautochdir
"刷新ctag
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
-- -------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.disable()
	end,
})
