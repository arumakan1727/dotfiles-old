"==============================
" Key mappings
"==============================

let mapleader = "\<Space>"
let maplocalleader = "\\"
map , <SubLeader>

"----------------------------------------------------------------------------------------
" Cursor move
nnoremap j gj
nnoremap k gk
nnoremap g; g;
nnoremap g, g,

"----------------------------------------------------------------------------------------
" Copy, Paste, Cut
nnoremap Y y$
nnoremap ,p ]p
nnoremap x "_x

vnoremap <SubLeader>y "+y
vnoremap <SubLeader>d "+d

"----------------------------------------------------------------------------------------
" Window
nnoremap <Leader>w <C-w>

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>

"----------------------------------------------------------------------------------------
" Undo behavior
" imap <BS> <C-g>u<BS>
" imap <CR> <C-g>u<CR>
" imap <DEL> <C-g>u<DEL>
" imap <C-w> <C-g>u<C-w>
" imap <C-u> <C-g>u<C-u>

"----------------------------------------------------------------------------------------
" Emacs style command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-h> <BS>
cnoremap <C-d> <Del>

"----------------------------------------------------------------------------------------
" [,] Moving
nnoremap [q           :cprevious<CR>
nnoremap ]q           :cnext<CR>
nnoremap [l           :lprevious<CR>
nnoremap ]l           :lnext<CR>
nnoremap [b           :bprevious<CR>
nnoremap ]b           :bnext<CR>
nnoremap [t           :tabprevious<CR>
nnoremap ]t           :tabnext<CR>

"----------------------------------------------------------------------------------------
" Search
" noremap * g*N
" noremap # g#n
" noremap g* *N
" noremap g# #n

"----------------------------------------------------------------------------------------
" Completion
"補完で選択されているものを挿入しない
" inoremap <expr><c-n> pumvisible() ? "\<Down>" : "\<C-n>"
" inoremap <expr><c-p> pumvisible() ? "\<Up>" : "\<C-p>"

"----------------------------------------------------------------------------------------
" Terminal
tnoremap <silent><ESC> <C-\><C-n>

"----------------------------------------------------------------------------------------
" Misc
"ファイル全体の内容を+レジスタにヤンク
nnoremap <Leader>y magg"+yG`a

"ファイル保存
nnoremap <SubLeader>w :w<CR>

"改行の挿入
nnoremap <CR> i<CR><ESC>

"ソース全体を整形
nnoremap <SubLeader>= mmgg=G`m
