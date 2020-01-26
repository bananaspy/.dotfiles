" Install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'terryma/vim-smooth-scroll'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ryanoasis/vim-devicons'

call plug#end()


if (has("termguicolors"))
 set termguicolors
endif

" Leader
let mapleader = ' '

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
nnoremap <silent> <Leader>j :call smooth_scroll#down(6, 15, 2)<CR>
nnoremap <silent> <Leader>k :call smooth_scroll#up(6, 15, 2)<CR>

" Lines
set number

:set relativenumber
:set rnu

function! ToggleRelativeNumber()
  if &relativenumber
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nmap <Leader>n :call ToggleRelativeNumber()<CR>

" Encoding
set encoding=utf-8

" Hotkeys
nnoremap <Leader>s :w<CR>

inoremap jh <Esc>
cnoremap jh <C-C>

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

map <Leader><Leader> <Plug>(easymotion-bd-w)

nnoremap <Leader>gob :GoBuild<CR>
nnoremap <Leader>gol :GoInstall<CR>
nnoremap <Leader>got :GoTest<CR>
nnoremap <Leader>gor :GoRun<CR>
nnoremap <Leader>goi :GoImport<space>
nnoremap <Leader>. :GoDef<CR>

nnoremap <Leader>H :vertical resize -10<CR>
nnoremap <Leader>J :resize +10<CR>
nnoremap <Leader>K :resize -10<CR>
nnoremap <Leader>L :vertical resize +10<CR>

nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>q! :q!<CR>

