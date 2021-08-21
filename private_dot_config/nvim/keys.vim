" This file is for custom key bindings for native vim functions

" Change leader key from \ to ,
let mapleader = ","

" Disable F1 bringing up the help doc every time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap jj <Esc>

" A saner way to save files.<F2> is easy to press
nnoremap <F2> :w<CR>

" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Shortcut to open init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Apply vim configurations without restarting
nnoremap <Leader>rc :so ~/.config/nvim/init.vim<CR>

" Create the file under cursor
:map <leader>gf :e <cfile><CR>

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Copy and paste to the system clipboard
noremap <Leader>y "*y
noremap <Leader>d "*d
noremap <Leader>p "*p
noremap <Leader>P "*P
vnoremap <C-c> "*y
