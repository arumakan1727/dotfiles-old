set signcolumn=yes
let g:ale_lint_on_save= 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines'],
      \ 'python': ['black'],
      \ 'cpp': ['clang-format'],
      \ 'c': ['clang-format'],
      \ 'go': ['gofmt', 'goimports'],
      \ }
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'cpp': ['gcc'],
    \ 'c': ['gcc'],
    \ }
let g:ale_cpp_cc_executable = 'gcc'
let g:ale_cpp_cc_options =
    \ " -std=c++17 -fsyntax-only @" . $HOME . "/Competitive-Programming/.share/cxx_flags.txt" .
    \ " -I " . $HOME . "/Competitive-Programming/.share/include/"
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_warning_str = '[W]'
let g:ale_echo_msg_error_str = '[E]'
let g:ale_echo_msg_format = '[%linter%] %severity% %s'
let g:airline_powerline_fonts = 1
