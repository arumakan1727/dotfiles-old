let g:ale_lint_on_save= 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black'],
      \ }
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
"let g:ale_sign_warning = '💩'
let g:ale_sign_warning = ''
let g:ale_sign_error = '🚫'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_error_str = '🚫'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
