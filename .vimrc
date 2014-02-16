" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

set tabstop=2
set shiftwidth=2
set expandtab

set showmatch
set incsearch

" Autoswitch encodings
set encoding=utf-8                                  " set charset translation encoding
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,cp1251,koi8r,cp866,ucs-2le   " encoding fallback order

"Paste mode toggle

set pastetoggle=<F2>

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

"Over 80 chars highlight
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Python-mode tweaks
set nofoldenable

" ctrlp
" cd ~/.vim
" git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
" :helptags ~/.vim/bundle/ctrlp.vim/doc
set runtimepath^=~/.vim/bundle/ctrlp.vim
