"==============================
" Base configuration
"==============================

augroup MyAutoCmd
  autocmd!
augroup END

set timeout timeoutlen=1000 ttimeoutlen=10
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set sh=zsh
set spelllang=en,cjk

"----------------------------------------------------------------------------------------
" Completions
set complete+=k "補完に辞書ファイル追加
set completeopt=menuone

"----------------------------------------------------------------------------------------
" Tab,Format
set expandtab
set smarttab
set shiftround
set autoindent smartindent

"tabstopはTab文字を画面上で何文字分に展開するか
"shiftwidthはcindentやautoindent時に挿入されるインデントの幅
"softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=2

"整形オプション (jp-reference: https://vim-jp.org/vimdoc-ja/change.html#fo-table)
autocmd! FileType * set formatoptions=clmrqj

"----------------------------------------------------------------------------------------
" Command Completion
set wildmenu
set wildmode=full
set history=10000

"----------------------------------------------------------------------------------------
" Search
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <silent><ESC><ESC> :nohlsearch<CR>
if has('nvim')
  set inccommand=split
endif

"----------------------------------------------------------------------------------------
" Window
set splitbelow
set splitright

"----------------------------------------------------------------------------------------
" File
set autoread    "他で書き換えられていたら自動で読み直す
set hidden      "編集中でも他のファイルを開けるようにする
set confirm     "未保存のときに確認する
set modeline    "ファイル末尾のモードライン読み込みを有効化

" Move temporary files to a secure location to protect against CVE-2017-1000382
if exists('$XDG_CACHE_HOME')
  let &g:directory=$XDG_CACHE_HOME
else
  let &g:directory=$HOME . '/.cache'
endif
let &g:undodir=&g:directory . '/vim/undo//'
let &g:backupdir=&g:directory . '/vim/backup//'
let &g:directory.='/vim/swap//'
" Create directories if they doesn't exist
if ! isdirectory(expand(&g:directory))
  silent! call mkdir(expand(&g:directory), 'p', 0700)
endif
if ! isdirectory(expand(&g:backupdir))
  silent! call mkdir(expand(&g:backupdir), 'p', 0700)
endif
if ! isdirectory(expand(&g:undodir))
  silent! call mkdir(expand(&g:undodir), 'p', 0700)
endif

set noswapfile
set noundofile
set backup
set writebackup
set backupskip=/tmp/*
autocmd! BufWritePre * let &backupext = '.' . strftime("%Y-%m-%d_%H:%M:%S")

"----------------------------------------------------------------------------------------
" Clipboard
" unnamedplus : +レジスタ
"   -> Clipboardセレクション ([Ctrl-v], [Shift-Ctrl-Insert] で貼り付けできる)
" unnamed : *レジスタ
"   -> Primaryセレクション ([Ctrl-Shift-v], [Shift-Insert] で貼り付けできる)
if has('nvim') || ((
      \      (exists('$DISPLAY') && executable('pbcopy'))
      \   || (exists('$DISPLAY') && executable('xclip'))
      \   || (exists('$DISPLAY') && executable('xsel')))
      \   && has('clipboard')
      \ )
  set clipboard&
  set clipboard^=unnamedplus,unnamed
endif

"----------------------------------------------------------------------------------------
" Beep bell
set vb t_vb=
set noerrorbells
set novisualbell

"----------------------------------------------------------------------------------------
" Syntax highlight
syntax enable
set t_Co=256
set background=dark

"true color support
let colorterm=$COLORTERM
if colorterm=='truecolor' || colorterm=='24bit' || colorterm==''
  if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

"----------------------------------------------------------------------------------------
" Fold
set foldmethod=marker

"----------------------------------------------------------------------------------------
" Visual
set display=lastline  " 長い行も一行で収まるように
set showmatch         " 括弧の対応をハイライト
set matchtime=0       " 括弧の対を見つけるミリ秒数
set showcmd           " 入力中のコマンドを表示
set number            " 行番号表示
set cursorline        " 現在行をハイライト
"set relativenumber    " 行番号を現在行からの相対的な距離に
"set nowrap            " 画面幅で折り返さない
set list              " 不可視文字表示
set listchars=tab:>\ ,trail:･,extends:>,precedes:<,nbsp:%
set title             " タイトルの表示
set scrolloff=5       " 上下方向のカーソルからのゆとり行数
set sidescrolloff=5   " 上下方向のカーソルからのゆとり行数
set pumheight=10      " 補完候補の表示数
set cmdheight=2       " コマンド入力領域の行数
set laststatus=2      " statuslineを常に表示
"set showtabline=2     " tablineを常に表示
set mouse=a           " マウス有効化

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" Cursor style
if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
else
  " insert mode - line
  let &t_SI .= WrapForTmux("\<Esc>[5 q")
  " common - block
  let &t_EI .= WrapForTmux("\<Esc>[1 q")
  if (v:version == 704 && has('patch687')) || v:version >= 705
    " replace mode - underline
    let &t_SR .= WrapForTmux("\<Esc>[3 q")
  endif
endif
