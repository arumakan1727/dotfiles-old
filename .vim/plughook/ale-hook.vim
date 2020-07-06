set signcolumn=yes
let g:ale_lint_on_save= 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black'],
      \ 'cpp': ['clang-format'],
      \ 'c': ['clang-format'],
      \ }
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'cpp': ['gcc'],
    \ 'c': ['gcc'],
    \ }
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra -Wshadow -Wno-sign-compare'
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_warning_str = '[W]'
let g:ale_echo_msg_error_str = '[E]'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:airline_powerline_fonts = 1
