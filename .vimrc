" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'klen/python-mode'
let pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']

Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'

Bundle 'scrooloose/syntastic'
" :SyntasticInfo - check conf and currently available checkers

Bundle 'rodjek/vim-puppet'

" Handlebars

Bundle 'mustache/vim-mustache-handlebars'

" Trailing Whitespaces

Bundle 'trailing-whitespace'

" Gundo
Bundle 'sjl/gundo.vim'

" Ag.vim, a vim frontend to https://github.com/ggreer/the_silver_searcher
Bundle 'rking/ag.vim'

Bundle 'fatih/vim-go'
Bundle 'roxma/SimpleAutoComplPop'

filetype plugin indent on     " required!

syntax on

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
let g:pymode_rope_lookup_project = 0

" From http://dougblack.io/words/a-good-vimrc.html
set cursorline
set wildmenu
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
nnoremap tn     :tabnew<CR>

" From https://github.com/fatih/vim-go-tutorial
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_fmt_command = "goimports"
" 1. variables are all defined in current scope, use keyword from current
" buffer for completion `<C-x><C-n>`
" 2. When the '.' is pressed, use smarter omnicomplete `<C-x><C-o>`, this
" works well with the vim-go plugin
autocmd FileType go call sacp#enableForThisBuffer({ "matches": [
            \ { '=~': '\v[a-zA-Z]{4}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
            \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>", "ignoreCompletionMode":1} ,
            \ ]
            \ })
