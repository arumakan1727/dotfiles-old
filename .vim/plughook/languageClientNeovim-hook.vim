set hidden
set signcolumn=yes

let g:LanguageClient_useVirtualText = 'No'

let g:LanguageClient_serverCommands = {}

if executable('clangd')
  let g:LanguageClient_serverCommands['cpp'] = ['clangd', '--compile-commands-dir=' . getcwd()]
endif

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <F5> :call LanguageClient_contextMenuItems()<CR>
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

au MyAutoCmd FileType * call LC_maps()
