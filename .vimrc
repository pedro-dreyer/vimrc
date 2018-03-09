" enable all features
set nocompatible
syntax enable
filetype plugin on
filetype indent on
"------------------------%<------------------------
"Ativa o corretor ortografico para ingês e portugês
"------------------------%<------------------------
:setlocal spell spelllang=en_us,pt

" Choose Colorsheme"
:colorscheme gruvbox
set background=dark

"Change unsaved buffers more easily
set hidden

"Better command-line completion
set wildmenu

" Always display the status line, even if only one window is displayed
set laststatus=2

" show line numbers
set number

"show commandline
set showcmd

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2


" Compiler and viewer settings
let g:tex_flavor='latex'  
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1  -src-specials -interaction=nonstopmode -file-line-error-style $* ' 
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf =  'SumatraPDF -reuse-instance '

" Use <F9> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>

" powerful backspaces
set backspace=indent,eol,start

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" don't wrap words
"set wrapmargin=5

"automatic wrapping
"set formatoptions+=t

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
    
" history
set history=50

" 1000 undo levels
set undolevels=1000

" show a ruler
set ruler

" show matching braces
set showmatch

" syntax highlight
syntax on

"indentation setting
set shiftwidth=4
set softtabstop=4
set expandtab

"consider the underscore as a part of a word
set iskeyword+=_
    
"remap F2 to save a latex document and then compile it
map <f2> :w<cr><leader>ll

"Buffer navigation 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"Automatically writes the closing brackets 
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"sets Ctrl-y to leaves the brackets
inoremap <C-u> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

"Make j and k behave properly
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Mutiple window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"clear the search highlight
noremap <C-z> :nohl<CR><C-L>

"change the 'up' and 'down' keys to travel half document 
noremap <up> <C-u>
noremap <down> <C-d>

" Always show the menu, insert longest match
set completeopt=menuone,longest
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"nn<C-j> <C-w>j
"nn<C-k> <C-w>k

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'bufexplorer.zip'
Bundle 'wincent/Command-T'
Bundle 'matchit.zip'
Bundle 'vim-indent-object'

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Feb-08 01:30):
" Change the <LocalLeader> key:
let maplocalleader = ","
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Force Vim to use 256 colors if running in a capable terminal emulator:
if &term =~ "xterm" || &term =~ "256" || $DISPLAY != "" || $HAS_256_COLORS == "yes"
    set t_Co=256
endif

