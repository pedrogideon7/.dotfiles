"
" An example for a.vimrc file.
"
"
" To use it, copy it to
"     for Unix:  ~/.vimrc
"     for Windows:  $VIM\.vimrc

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Put these in an autocmd group, so that we can delete them easily.

let g:python_host_prog='/usr/bin/python2.7'
let g:python3_host_prog='/home/kitso/.pyenv/versions/3.5.1/bin/python'

augroup.vimrcEx
  autocmd!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   execute "normal! g`\"" |
\ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

windo setlocal number

filetype plugin indent on    " required

call plug#begin('~/.nvim/bundle/')
" Let Plug manage Plug
" Required

" My Bundles here:
" Refer to |:Plug-examples|.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'csexton/snipmate.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'arkwright/vim-whiplash'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ekalinin/Dockerfile.vim', {'for': 'dockerfile'}
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-tmux-clipboard'
Plug 'janko-m/vim-test', {'for': ['go', 'rb']}


" binary files
Plug 'Shougo/vinarise.vim'
let g:vinarise_enable_auto_detect=1

" Git stuff
Plug 'jreybert/vimagit'

" Python stuff
Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
Plug 'lepture/vim-jinja', {'for': ['jinja', 'html']}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'tmhedberg/SimpylFold', {'for': 'python'}

" Arduino
Plug 'jplaut/vim-arduino-ino', {'for': 'ino'}

" webdev stuff
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'html', 'jinja'] }
Plug 'coot/html5-syntax.vim', { 'for': ['css', 'scss', 'html'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'jinja'] }
Plug 'michalliu/jsruntime.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
Plug 'michalliu/jsoncodecs.vim', { 'for': ['javascript', 'html', 'jinja', 'css', 'scss', 'json'] }
"Plug 'michalliu/sourcebeautify.vim',  { 'for': ['css', 'scss', 'html', 'jinja'] }
Plug 'plasticboy/vim-markdown', { 'for': ['html', 'md', 'jinja'] }
Plug 'rstacruz/sparkup'

" java tools
let java_highlight_functions = 1
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" GO tools
Plug 'fatih/vim-go', {'for': 'go'}

" C and C++
Plug 'justinmk/vim-syntax-extra', {'for': ['c', 'cpp', 'h', 'cxx', 'cc', 'hpp']}
Plug 'arakashic/chromatica.nvim', {'for': ['c', 'cpp', 'h', 'cxx', 'cc', 'hpp']}
let g:chromatica#libclang_path='/opt/cling_2016-07-31_ubuntu16/lib/libclang.so'
let g:chromatica#responsive_mode=1

" Markdown
Plug 'vim-pandoc/vim-pandoc', {'for': ['md', 'markdown.pandoc']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['md', 'markdown.pandoc']}
" Eyecandy
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'zefei/vim-colortuner'
Plug 'NLKNguyen/papercolor-theme' "using it for the airline prompt
"Plug 'cohlin/vim-colorschemes'
"Plug 'caglartoklu/ftcolor.vim'
"Plug 'morhetz/gruvbox'
"Plug 'google/vim-colorscheme-primary'


call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line
" the colorscheme
set encoding=utf-8     " Necessary to show unicode glyphs
set laststatus=2       " Always show the statusline
set showtabline=2      " Alway show the tabline, even if there is only one tab
" set t_Co = 256           " explicitly tell vim my terminal supports 256 colors
set noshowmode         " Hide the default mode text (e.g -- INSERT -- below the statusline)
set list
set listchars=tab:ᐅ\ ,eol:𐒇
set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)ྲ
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set clipboard+=unnamedplus
set cursorline
set autoread

" do not use arrows in normal mode
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
" do not use arrows in insert mode
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
" do not use arrows in visual mode
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

"tabs & indenatation
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set shiftround
set completeopt+=longest

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
au VimResized * exe "normal! \<c-w>="

" show current file in NerdTree
map <silent> <C-s> :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" reselect visual block after indentation
vnoremap < <gv
vnoremap > >gv

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu

" spelling
"set spell spelllang=en_us
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype jinja setlocal ts=2 sw=2 expandtab
autocmd Filetype jinja2 setlocal ts=2 sw=2 expandtab
"autocmd Filetype jinja setlocal ts=2 sw=2 expandtab

"highlighting hacks
hi LineNr ctermbg = grey
hi normal ctermfg = grey
"

" my keybinding mappings
noremap <C-s> :w<cr> " save in normal mode
inoremap <C-s> <Esc>:w<cr> " save in insert mode and go to normal mode

" tabs
map <leader>l <esc>:tabnext<CR>
map <leader>h <esc>:tabprevious<CR>

let mapleader=","
noremap \ ,

imap <leader>' ''<ESC>
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>% %%<ESC>i

nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" new line above or below and get out of insert mode
noremap g<C-o> o<ESC>k
noremap gO O<ESC>j

" upper or lowercase the current word
noremap g^ gUiW
noremap gv guiW
vnoremap g^ gUi<ESC>
vnoremap gv gui<ESC>

" airline Status stuff
let g:airline_powerline_fonts=1
let g:airline_theme = "PaperColor"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" syntastic stuff
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"

" vim-go stuff
let g:go_list_type = "quickfix" " avoids conflicts with syntatstic
" EYE CANDY
source ~/.nvim/colors/mytopfunky.vim
"set background=dark
"colorscheme PaperColor
