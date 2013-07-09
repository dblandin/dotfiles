" devon blandin's .vimrc
" http://devonblandin.com

" ViM mode and syntax
set nocompatible | syn on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off " required for vundle!

" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'MarcWeber/vim-addon-mw-utils'

" dependencies
Bundle 'vim-scripts/tlib'

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

" insert/visual mode
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'

" snippets
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'rcyrus/snipmate-snippets-rubymotion'

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

map <Leader>c :Ack<space>
map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>vi :tabe ~/.vimrc<CR>
map <leader>/ :nohl<CR>
map <leader>p Orequire 'pry'; binding.pry<ESC>j
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " kill all hash rockets
map <leader>m :!open -a Marked %<cr><cr> " Markdown preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=50
set ruler
syntax on

au BufNewFile,BufRead *.hamlbars setf haml

" solarized options
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
set numberwidth=5
set wmw=0
set wmh=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoload .vimrc upon edit
autocmd! bufwritepost .vimrc source ~/.vimrc

" Search
set hlsearch
set incsearch

" Indentation
set softtabstop=2 shiftwidth=2 expandtab
set autoindent

set ofu=syntaxcomplete#Complete
autocmd FileType java setlocal softtabstop=4 shiftwidth=4 expandtab

" completion
set wildmode=list:longest,list:full
set wildignore+=*/.git/*,**/vendor/ruby/**,**/bin/*,**/tmp/*,*/.*,*.o,*.obj,.git,*.rbc,*.class,ruby/*
set complete=.,w,t

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
" Testing functions borrowed from Gary Berhardt
" [github.com/garybernhardt/dotfiles/blob/master/.vimrc]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running Tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :w\|:silent !tmux send-keys -t bottom 'rspec -f d -t focus' C-m <CR>\|:redraw!<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>y :TagbarToggle<CR>
map <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
nnoremap <silent> <leader>r :CtrlP<CR>

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
