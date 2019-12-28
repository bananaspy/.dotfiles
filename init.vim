" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'terryma/vim-smooth-scroll'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()


if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

" Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Autocompletion
let g:deoplete#enable_at_startup = 1

" Scrolling
nnoremap <silent> J :call smooth_scroll#down(6, 15, 2)<CR>
nnoremap <silent> K :call smooth_scroll#up(6, 15, 2)<CR>
nnoremap <silent> H :call smooth_scroll#up(&scroll, 40, 5)<CR>
nnoremap <silent> L :call smooth_scroll#down(&scroll, 40, 5)<CR>

" Lines
set number

:set relativenumber
:set rnu

" Encoding
set encoding=utf-8

" Leader
let mapleader = ' '

" Hotkeys
inoremap jh <Esc>
cnoremap jh <C-C>

nnoremap <C-w>t :NERDTreeToggle<CR>
nnoremap <C-w>f :NERDTreeFind<CR>

map <Leader>w <Plug>(easymotion-bd-w)

nnoremap <C-w>gob :GoBuild<CR>
nnoremap <C-w>gol :GoInstall<CR>
nnoremap <C-w>got :GoTest<CR>
nnoremap <C-w>gor :GoRun<CR>
nnoremap <C-w>goi :GoImport<space>
nnoremap <Leader>. :GoDef<CR>

nnoremap <C-w>L :vertical resize -5<CR>
nnoremap <C-w>J :resize +5<CR>
nnoremap <C-w>K :resize -5<CR>
nnoremap <C-w>H :vertical resize +5<CR>

nnoremap <C-w>S :source ~/.vimrc<CR>


