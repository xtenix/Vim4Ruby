"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KEY BINDINGS to remember
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" za - toggle folds (zo - open, ac - close)
" ,f - LustyExplorer
" ,g - Find in NERDTree
" ,t - FuzzyFinder
"
"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Must be first line to ensure pathogen is used to manage plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  syntax on
  set guioptions-=T
  set background=dark
  colorscheme molokai
  "set nonu
    set guifont=Menlo\ Regular:h13
else
    colorscheme zellner
    set background=light
    set nonu
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=2

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set linespace=2
set number
set tabstop=4
set shiftwidth=2
set expandtab
set smarttab
" set ai "Auto indent
" set si "Smart indent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wmh=0

function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
" map <S-C-j> <C-W>j<C-W>_
" Smart way to move btw. windows
" map <C-j> <C-W>j  " Move without splitting
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-h> :call WinMove('h')<cr>
map <C-l> :call WinMove('l')<cr>
map <C-j> :call WinMove('j')<cr>


map <C-s> <C-W>v
map <C-i> <C-W>s
" map <C-s> <C-W>v
" map <C-a> <C-W>s
"      map <C-0> <C-W>L
"      map <C-1> <C-W>H
"      map <C-> <C-W>+

" Switch to alternate file
map <C-Tab> :bprevious<cr>
map <C-S-Tab> :bprevious<cr>


map <leader>j <C-W>J
map <leader>k <C-W>K
map <leader>h <C-W>H
map <leader>l <C-W>L



""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
if has("gui_running")
  " Always hide the statusline
  set laststatus=2

  " Format the statusline
  " set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c\ %P
  " set statusline=%<\ %{HasPaste()}%t%m\ @\ %f%r%h%=%-35.(\CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)\ %y%)
  " set statusline=%<\ %{HasPaste()}%t%m\ @\ %{CurFileDir(\"\%f\"\,\"\%t\")}%f%r%h%=%-35.(\CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)\ %y%)
  " set statusline=%<\ %{HasPaste()}%F%m%r%h%=%-35.(\CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)\ %y%)
  " set statusline=%<\ %{HasPaste()}%t%m\ @\ %{CurFileDir()}%r%h%=%-35.(\CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)\ %y%)
  " set statusline=%<\ %{HasPaste()}%t%m\ @\ %{CurFileDir()}%r%h%=%-35.(\CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\/\%L\ (%P)\ %y%)
  "set statusline=%<\ %{HasPaste()}%t%m%r%h%=%-35.(@\ %{StatusLineCurFileDir()}\ \|\ \CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\/\%L\ (%P)\ %y%)
  "set statusline=%<\ %{HasPaste()}%f%m%r%h%=%-35.(\ \CWD:\ %r%{CurDir()}%h\ \|\ line:\ %l\/\%L\ (%P)\ %y%)

  " set statusline=%<\ \ \ %{HasPaste()}%t

  set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
  
  function! CurDir()
      let curdir = substitute(getcwd(), '/Users/rdhallman/', "~/", "g")
      " let curdir = getcwd()
      return curdir
  endfunction

  function! StatusLineCurFileDir()
    let filename = expand("%:t")
    let relpath = expand("%:f")
    let userpath = substitute(relpath, '/Users/rdhallman/', "~/", "g")
    let curdir = substitute(userpath, filename, "", "g")
    retur curdir
  endfunction

  function! HasPaste()
      if &paste
          return 'PASTE MODE  '
      else
          return ''
      endif
  endfunction


  " Specify the behavior when switching between buffers
  try
    set switchbuf=usetab
    set stal=2
  catch
  endtry

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Codepaths
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:codepath = "/Users/rdhallman/rg"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>o       :NERDTreeToggle ~/rg<CR>
map <Leader>g       :NERDTreeFind<CR>
let NERDTreeIgnore          =   ['\.pyc$','\.swp$']                 "ignore compiled python files
let NERDTreeMouseMode       =   3                                   "single-click to open files/nodes
let NERDTreeWinPos          = 'left'
let NERDTreeSplitVertical   =   1                                   "and open as vsplit
let NERDTreeChDirMode       =   2                                   "change working dir when I change root
let NERDTreeShowBookmarks   =   1
let NERDTreeMinimalUI       =   1
let NERDTreeShowHidden      =   1

nnoremap <silent> <F4> :NERDTreeToggle `=codepath#path ()`<cr>
inoremap <silent> <F4> <Esc>:NERDTreeToggle `=codepath#path()`<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => BufExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BufExplorer Defaults
let g:bufExplorerShowDirectories=0
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerShowUnlisted=0
let g:bufExplorerShowRelativePath=1 
 

nmap <C-tab> :BufExplorer<CR>
map <C-tab> :BufExplorer<CR>
imap <C-tab> <Esc>:BufExplorer<CR>

nmap <Leader>x  :bdelete!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Project.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Project plugin global settings
let g:proj_flags="imstgLT"
map <Leader>p	:Project<CR>


    function! s:Wc()
        let b:loadcount=0
        function! SpawnExec(infoline, fname, lineno, data)
	    let b:loadcount = b:loadcount + 1
	    if getchar(0) != 0 | let b:stop_everything=1 | endif
        endfunction
        call Project_ForEach(1, line('.'), "*SpawnExec", 0, '')
        delfunction SpawnExec
        echon b:loadcount." Files\r"
        unlet b:loadcount
        if exists("b:stop_everything")
	    unlet b:stop_everything
	    echon "Aborted.\r"
	endif
    endfunction

    nnoremap <buffer> <silent> <LocalLeader>K :call <SID>Wc()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-T
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc


nmap <Leader>w  :CommandTBuffer<CR>
nmap <Leader>u  :CommandTFlush<CR>

let g:CommandTMaxFiles=20000
let g:CommandTMatchWindowAtTop=0
let g:CommandTMatchWindowReverse=1

map <silent> <C-T> :CommandT <c-r>=codepath#path()<CR><CR>
imap <silent> <C-T> <ESC>:CommandT <c-r>=codepath#path()<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LustyExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>f  :LustyFilesystemExplorerFromHere<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FuzzyFinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

nmap <Leader>t  :FufFile<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Specky
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:speckyRunSpecCmd = "bundle exec rspec -r ~/.vim/bundle/Specky/ruby/specky_formatter.rb -f SpeckyFormatter"
let g:speckyBannerKey        = "<C-r>b"
let g:speckyQuoteSwitcherKey = "<C-r>'"
let g:speckyRunRdocKey       = "<C-r>r"
let g:speckySpecSwitcherKey  = "<C-r>x"
let g:speckyRunSpecKey       = "<Leader>r"
let g:speckyRunRdocCmd       = "fri -L -f plain"
let g:speckyWindowType       = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ruby Debugger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ruby_debugger_spec_path = 'rspec'
let g:ruby_debugger_progname = 'mvim'

map <Lkader>b  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <Leader>b  :call g:RubyDebugger.toggle_breakpoint()<CR>
map <Leader>v  :call g:RubyDebugger.open_variables()<CR>
map <Leader>dm  :call g:RubyDebugger.open_breakpoints()<CR>
map <Leader>dt  :call g:RubyDebugger.open_frames()<CR>
map <Leader>s  :call g:RubyDebugger.step()<CR>
map <Leader>df  :call g:RubyDebugger.finish()<CR>
map <Leader>m  :call g:RubyDebugger.next()<CR>
map <Leader>dc  :call g:RubyDebugger.continue()<CR>
map <Leader>de  :call g:RubyDebugger.exit()<CR>
map <Leader>dr  :call g:RubyDebugger.remove_breakpoints()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_auto_loc_list=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ConqueTerm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ConqueTerm_Color = 1
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_TERM = 'xterm'
let g:ConqueTerm_Syntax = 'conque_term'
let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'

map <leader>c :ConqueTerm bash<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ZoomWin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-a> <C-W>o

set nowrap



nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>



