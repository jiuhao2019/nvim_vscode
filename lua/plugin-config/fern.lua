vim.cmd([[
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
function! s:hijack_directory() abort
let path = expand('%:p')
if !isdirectory(path)
    return
    endif
    bwipeout %
    execute printf('Fern %s', fnameescape(path))
    endfunction
    " Custom settings and mappings.
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
