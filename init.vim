"All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'wfxr/minimap.vim'

call plug#end()

syntax on
	if exists('g:started_by_firenvim')
colorscheme gruvbox
	let airline_theme = 'gruvbox'
else
	colorscheme wal
endif

let g:airline_powerline_fonts = 1

set relativenumber
set number

set clipboard=unnamedplus
set mouse=a

"nerd tree autocommands
"open if no files on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open when opening dirs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | exe 'cd '.argv()[0] | endif

"close if nerdtree is last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"

"keybindings
"thingys for <++> marks
nnoremap <Space><Space> :let tmpsearch = @/<Return>/<++><Return>:let @/ = tmpsearch<Return>4s
nmap + i<++><Esc>

"toggle nerdtree
map <C-n> :NERDTreeToggle<Return>
