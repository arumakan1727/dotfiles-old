" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><Tab>
      \ pumvisible() ? "\<Down>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

imap <expr><S-Tab>
      \ pumvisible() ? "\<Up>" : "\<S-Tab>"

smap <expr><TAB>
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

imap <expr><CR>
      \ (pumvisible() && neosnippet#expandable()) ?
      \ "\<Plug>(neosnippet_expand_or_jump)" :
      \ pumvisible() ? "\<C-y>" : "\<C-g>u<CR>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
