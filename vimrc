syntax on
filetype plugin on
set background=dark
set number
set tabstop=4
set shiftwidth=4

map <C-P> :bp<cr>
map <C-N> :bn<cr>
map <C-X> :Bclose<cr>

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

let g:NERDTreeDirArrows=0

"noremap <C-a>y :TlistToggle<cr>
noremap nqq :NERDTreeToggle /Users/cpk/src<cr>
inoremap jj <Esc>

execute pathogen#infect() 

set backspace=indent,eol,start

filetype plugin indent on
nnoremap <silent> <leader>z :Goyo<cr>

" rainbow parentheses
let g:rainbow_active = 1
noremap rnn :RainbowToggle<cr>
