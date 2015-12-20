syntax on
filetype plugin on
set background=dark
set number

let g:rainbow_active = 1
map <C-P> :bp<cr>
map <C-N> :bn<cr>

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

let g:NERDTreeDirArrows=0

noremap nqq :NERDTreeToggle /home/cpk/src<cr>
inoremap jj <Esc>

execute pathogen#infect() 

set backspace=indent,eol,start

filetype plugin indent on
