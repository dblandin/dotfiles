" devon blandin's .vimrc
" http://devonblandin.com

" ViM mode and syntax
set nocompatible | syn on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically setup Vundle
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/vundle/README.md")
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
  let has_vundle=0
endif

filetype off " required for vundle!
set rtp+=$HOME/.vim/bundle/vundle/ " include vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" snipMate, dependencies: addon-mw-utils, tlib_vim, vim-snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'

" snippets
Bundle 'honza/vim-snippets'

" navigation
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" utilities
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-eunuch'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'

" insert/visual mode
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'

" syntax
Bundle 'vim-coffee-script'
Bundle 'davidoc/taskpaper.vim'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'

filetype indent plugin on

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeWinPos = "right"

let g:tagbar_autofocus = 1

" Dash
"
let g:dash_map = {
  \ 'ruby'       : 'rubymotion',
\ }

nmap <silent> <leader>f <Plug>DashGlobalSearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "
let g:mapleader=" "

map      <leader>c :Ack<space>
map      <leader>n :sp ~/Dropbox/notes/coding-notes.txt<cr>
map      <leader>vi :tabe $MYVIMRC<CR>
map      <leader>/ :nohl<CR>
map      <leader>pr orequire 'pry'; binding.pry<ESC>:w<CR>
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " kill all hash rockets
map      <leader>m :!open -a Marked %<cr><cr> " Markdown preview
nmap     <leader>a= :Tab /=<CR>
vmap     <leader>a= :Tab /=<CR>
nmap     <leader>a: :Tab /:\zs<CR>
vmap     <leader>a: :Tab /:\zs<CR>
nnoremap <leader>. :call OpenTestAlternate()<cr>
map      <leader>t :call RunTestFile()<cr>
map      <leader>T :w\|:silent !tmux send-keys -t bottom 'rspec -f d -t focus' C-m <CR>\|:redraw!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader>y :TagbarToggle<CR>
map <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
nnoremap <silent> <leader>r :CtrlP<CR>

" use jk instead of <esc> to jump out of insert mode
inoremap <esc> <nop>
inoremap jk <esc>l

" Tabularize
nmap <Leader>a= :Tab /=<CR>
vmap <Leader>a= :Tab /=<CR>
nmap <Leader>a> :Tab /=><CR>
vmap <Leader>a> :Tab /=><CR>
nmap <Leader>a: :Tab /:\zs<CR>
vmap <Leader>a: :Tab /:\zs<CR>

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" shortcuts
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W><bar>
nmap <C-L> <C-W>l<C-W><bar>

map <S-H> gT " tab back
map <S-L> gt " tab forward

map <C-t><C-t> :tabnew<CR> " open new tab
map <C-t><C-w> :tabclose<CR> " close tab

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev adn and
iabbrev dfe def
iabbrev @@ dblandin@gmail.com
iabbrev ssig --<cr>Devon Blandin<cr>dblandin@gmail.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set history=50
set ruler
syntax on

au BufNewFile,BufRead *.hamlbars setf haml

" color scheme
colorscheme Tomorrow-Night

" fix xterm colors
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

" show operators on status line
set showcmd

set number
set numberwidth=2
set wmw=0
set wmh=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autoload .vimrc upon edit
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Use silver searcher with ack.vim
" brew install the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Search
set hlsearch
set incsearch

" Indentation
set softtabstop=2 shiftwidth=2 expandtab
set autoindent

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|build\|bin'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intuitive backspacing in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Speed up vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set notimeout
set ttimeout
set timeoutlen=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape between modes (iTerm)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup Preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace Highlighting && Deletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000
set undolevels=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle Pasting
set pastetoggle=<F2>

" Toggle Highlighting
nnoremap <silent> <F3> :nohl<CR>

" Toggle Spelling
map <F4> :setlocal spell! spelllang=en_us<CR>

" Remove any trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2               " always show statusbar
set statusline=
set statusline+=%-10.3n\       " buffer number
set statusline+=%f\            " filename
set statusline+=%h%m%r%w       " status flags
set statusline+=%=             " right align remainder
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P           " file position

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between test and production code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running Tests
" Testing functions borrowed from Gary Berhardt
" [github.com/garybernhardt/dotfiles/blob/master/.vimrc]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTestFile(...)
  if a:0
      let command_suffix = a:1
  else
      let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
      call SetTestFile()
  elseif !exists("t:grb_test_file")
      return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

" Write the file and run tests for the given filename
function! RunTests(filename)
  if match(a:filename, '\.feature$') != -1
      exec ":silent !tmux send-keys -t bottom 'cucumber -r features " . a:filename . "' C-m"
      exec ":redraw!"
  else
      exec ":silent !tmux send-keys -t bottom 'rspec --color " . a:filename . "' C-m"
      exec ":redraw!"
  end
endfunction
