" Initialize file with the template.
" This is for Competitive programming.

command! -nargs=1 -complete=dir Template call s:setTemplate(<f-args>)

function! s:setTemplate(template_dir) abort
  let l:template_file = a:template_dir . '/template.' . &filetype
  if !filereadable(expand(l:template_file))
    throw "Template not found: " . l:template_file
  endif
  execute "%delete"
  execute "0read " . l:template_file
endfunction

nnoremap <F9> :Template ~/Competitive-Programming/.share/Templates<CR>
