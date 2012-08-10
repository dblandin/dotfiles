" devon blandin's .vimrc
" http://devonblandin.com

let g:pathogen_disabled = []
if !has('gui_running')
   call add(g:pathogen_disabled, 'powerline')
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set history=50
set ruler

" autoload .vimrc upon edit
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on

" solarized options 
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

set hlsearch
set incsearch

set number
set clipboard=unnamed

set softtabstop=2 shiftwidth=2 expandtab
set autoindent

filetype indent plugin on
set ofu=syntaxcomplete#Complete
autocmd FileType java setlocal softtabstop=4 shiftwidth=4 expandtab

let mapleader=","
let g:mapleader=","

" status line
set statusline=%t 

" backup settings
set backupdir=~/tmp

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W><bar>
nmap <C-L> <C-W>l<C-W><bar>
set wmw=0
set wmh=0

map <S-H> gT
map <S-L> gt

map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR> 

nmap <leader>/ :nohl<CR>

cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

cmap cd. lcd %:p:h

nnoremap <silent> <F8> :CommandT<CR> 

nnoremap <silent> <F6> :NERDTreeToggle<CR> 
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <silent> <F7> :TagbarToggle<CR> 
let g:tagbar_autofocus = 1
