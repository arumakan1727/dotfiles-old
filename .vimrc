"===============================
" .vimrc and neovim's init.vim
"===============================

" Encodings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,sjis,latin1
set fileformats=unix,dos,mac

" This .vimrc's encoding (NOTE: This must be written after `set encoding=...`)
scriptencoding utf-8

" Functions
source ~/.vim/functions.vim

" Base configuration
source ~/.vim/base.vim

" Plugin install
source ~/.vim/pluginst.vim

" Key mappings
source ~/.vim/keymappings.vim

" Template (for competitive programming)
source ~/.vim/template-set.vim

colorscheme sonokai
