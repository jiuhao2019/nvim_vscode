vim.cmd([[
let g:Autoformat_verbosemode    = 1
let g:formatdef_allman          = '"astyle --style=bsd --indent=spaces=4 --delete-empty-lines --indent-preproc-block --pad-oper --pad-header --unpad-paren --suffix=none --align-pointer=name --convert-tabs --verbose"'
let g:formatters_c              = ['allman']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
]])
