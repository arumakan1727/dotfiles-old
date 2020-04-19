" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><Tab>
      \ neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
      \ "\<Down>"
      \ "\<Tab>"

imap <expr><S-Tab>
      \ pumvisible() ? "\<Up>" : "\<S-Tab>"


smap <expr><TAB>
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

imap <expr><CR>
      \ (neosnippet#expandable()) ? "\<Plug>(neosnippet_expand_or_jump)" :
      \ (pumvisible() && complete_info()['selected'] != '-1') ? "\<C-y>" :
      \ "\<CR>"

"let g:neosnippet_enable_completed_snippet = 1

let g:neosnippet#snippets_directory='~/.vim/snippets/'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
