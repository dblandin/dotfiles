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
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'

" insert/visual mode
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'

" snippets
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/snipmate-snippets'

" syntax
Bundle 'vim-coffee-script'

filetype indent plugin on

" CtrlP
nnoremap <silent> <leader>r :CtrlP<CR>
set wildignore+=*/.git/*,**/vendor/ruby/**,**/bin/*,**/tmp/*,*/.*

" Tabularize
nmap <Leader>a= :Tab /=<CR>
vmap <Leader>a= :Tab /=<CR>
nmap <Leader>a> :Tab /=><CR>
vmap <Leader>a> :Tab /=><CR>
nmap <Leader>a: :Tab /:\zs<CR>
vmap <Leader>a: :Tab /:\zs<CR>

" NERDTree
map <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeWinPos = "right"

nnoremap <silent> <leader>y :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=50
set ruler
syntax on

" solarized options 
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

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

" Clipboard
set clipboard=unnamed

" Indentation
set softtabstop=2 shiftwidth=2 expandtab
set autoindent

set ofu=syntaxcomplete#Complete
autocmd FileType java setlocal softtabstop=4 shiftwidth=4 expandtab

" completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,ruby/*
set complete=.,w,t

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

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intuitive backspacing in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
let g:mapleader=" "

" vim-ruby-conque commands
nmap <silent> <Leader>rcrr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>rcss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>rccc :call RunCucumberCurrentFileConque()<CR>
nmap <silent> <Leader>rcRR :call RunRakeConque()<CR>

map <Leader>p <C-^> " Go to previous file
map <Leader>n <C-^> " Go to next file

" Ack
map <Leader>c :Ack<space>

" status line
set statusline=%t 

" disable search highlighting
nmap <silent> <leader>/ :nohl<CR>

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
:set pastetoggle=<F2>

" Toggle Highlighting
:nnoremap <silent> <F3> :nohl<CR>

" Toggle Spelling
:map <F4> :setlocal spell! spelllang=en_us<CR>

" Remove any trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W><bar>
nmap <C-L> <C-W>l<C-W><bar>

map <S-H> gT " tab back
map <S-L> gt " tab forward

map <C-t><C-t> :tabnew<CR> " open new tab
map <C-t><C-w> :tabclose<CR> " close tab


nmap <leader>/ :nohl<CR> " disable search highlight

cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

" set working directory to location of current file
cmap cd. lcd %:p:h

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
" Toggle Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Pasting
:set pastetoggle=<F2>

" Toggle Highlighting
:nnoremap <silent> <F3> :nohl<CR>

" Toggle Spelling
:map <F4> :setlocal spell! spelllang=en_us<CR>

" Remove any trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let

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
map <leader>T :call RunNearestTest()<cr>

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

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w

    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        else
            exec ":!bundle exec rspec --color " . a:filename
        end
    end
endfunction
