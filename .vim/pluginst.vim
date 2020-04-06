"==============================
" Plugin config, install
"==============================

if &compatible
  set nocompatible
endif

"-------------------------------------------------------------------------------
" dein自体のインストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME

if exists('g:nyaovim_version')
  let s:dein_cache_path = s:cache_home . '/nyaovim/dein'
elseif has('nvim')
  let s:dein_cache_path = s:cache_home . '/nvim/dein'
else
  let s:dein_cache_path = s:cache_home . '/vim/dein'
endif

let s:dein_repo_dir = s:dein_cache_path
      \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif
  let &runtimepath = s:dein_repo_dir . "," . &runtimepath
endif

"-------------------------------------------------------------------------------
" プラグイン読み込み & キャッシュ作成
if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.vim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.vim/deinlazy.toml', {'lazy' : 1})

  if exists('g:nyaovim_version')
    call dein#add('rhysd/nyaovim-popup-tooltip')
    call dein#add('rhysd/nyaovim-markdown-preview')
    call dein#add('rhysd/nyaovim-mini-browser')
  endif

  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if dein#check_install()
  call dein#install()
endif

"filetype plugin indent on
syntax enable
