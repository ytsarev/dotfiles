" Plugin installation
" Source of inspiration: https://tpaschalis.github.io/vim-go-setup/
" git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
" git clone https://github.com/bronson/vim-trailing-whitespace ~/.vim/pack/dist/start/vim-trailing-whitespace
" https://github.com/sonph/onehalf/tree/master/vim
" mkdir -p ~/.vim/pack/coc/start
" cd ~/.vim/pack/coc/start && git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
" vim -c "helptags coc.nvim/doc/ | q"
" git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

" Control all other files
set shiftwidth=4

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Hardcore mode, disable arrow keys.
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"

" Status line types/signatures.
let g:go_auto_type_info = 1

" au filetype go inoremap <buffer> . .<C-x><C-o>

" If you want to disable gofmt on save
" let g:go_fmt_autosave = 0


" NERDTree plugin specific commands
:nnoremap <C-g> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree


" air-line plugin specific commands
"let g:airline_powerline_fonts = 1

" Jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" vim-terraform

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" coc autocomplete
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
