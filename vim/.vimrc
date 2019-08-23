" ==================== Plugins ====================
call plug#begin()

" Airline
Plug 'bling/vim-airline'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Dracula theme
Plug 'dracula/vim'

" Sayonara
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

" Go support for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

" ==================== Vim Settings ====================
set number                          " show line numbers
set backspace=indent,eol,start      " backspace all the things
set showcmd                         " show the command while typing it
set noswapfile                      " no swap files needed
set nobackup                        " backup files are clutter
set nowritebackup
set splitright                      " configure default splits
set splitbelow
set encoding=utf-8                  " default to utf-8 encoding
set autowrite                       " save before :next etc.
set autoread                        " automatically pull in changes
set hidden                          " allow buffers to be hidden with changes
au FocusLost * :wa                  " save when focus is lost
set incsearch                       " show matches while typing search string
set hlsearch                        " highlight all search matches
set ignorecase                      " search case insensitively
set smartcase                       " use case when the search string has uppercase
set ttyfast                         " assume we can handle faster refreshing
set lazyredraw                      " do not redraw when running functions
set scrolloff=5                     " start scrolling 3 lines before bottom
set showmatch                       " quickly show the matching bracket
set autoindent                      " self explanatory
set smarttab                        " setup tabs to be four spaces
set tabstop=4                       " setup tabs to be four spaces
set shiftwidth=4                    " setup tabs to be four spaces
set expandtab                       " setup tabs to be four spaces
set shiftround                      " use rounding when shifting tabs and spacing is uneven
set clipboard=unnamed               " use system clipboard

" Scroll by row rather than line so wrapped lines get included.
nnoremap j gj
nnoremap k gk

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \ exe "normal! g`\"" |
          \ endif

    augroup END

    "==================== golang ====================
    autocmd FileType go nnoremap <buffer> <F9> :! go run *.go<cr>

else
endif " has("autocmd")


"==================== colorscheme ====================
let g:dracula_colorterm = 0
silent! colorscheme dracula


" ==================== Code Folding ====================
set nofoldenable
set foldlevel=2
set foldmethod=indent

" ==================== Functions ====================
command! CLEAN retab | %s/\s\+$//


" ==================== Keyboard Shortcuts ====================
" set our leader key to space
let mapleader = " "
let g:mapleader = " "

" quit smartly
nnoremap <leader>q :Sayonara<cr>

" Remove search highlight
nnoremap <leader>h :noh<CR>

" Buffer prev/next
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" list buffers and switch
nnoremap <leader>b :ls<cr>:b<space>
" Fast saving
nnoremap <leader>w :w!<cr>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Just go out in insert mode
imap jk <ESC>l

" Do not show stupid q: window
map q: :q

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Go shortcuts just for .go files
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" ==================== File searching ====================
set wildmenu
set wildmode=list:full
set wildignorecase
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *


" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>



